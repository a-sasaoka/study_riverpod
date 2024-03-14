import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:study_riverpod/step_17/model/update_info.dart';
import 'package:version/version.dart';

part 'update_request_controller.g.dart';

/// RemoteConfigからアップデート情報を取得するコントローラ
@Riverpod(keepAlive: true)
class UpdateRequestController extends _$UpdateRequestController {
  @override
  Future<UpdateRequestType> build() async {
    // RemoteConfigインスタンス取得
    final remoteConfig = FirebaseRemoteConfig.instance;

    // タイムアウトとフェッチのインターバル時間を設定
    const interval = Duration.zero;
    await remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: interval,
      ),
    );

    // アクティベート
    await remoteConfig.fetchAndActivate();

    // RemoteConfigから情報を取得
    final string = remoteConfig.getString('update_info');
    if (string.isEmpty) {
      return UpdateRequestType.not;
    }

    // JSONをMapに変換
    final map = json.decode(string) as Map<String, Object?>;
    // JSONの情報からアップデート情報を作成
    final entity = UpdateInfo.fromJson(map);

    // 現在のアプリバージョンを取得
    final appPackageInfo = await PackageInfo.fromPlatform();
    final currentVersion = Version.parse(appPackageInfo.version);

    final enabledAt = entity.enabledAt;
    final requiredVersion = Version.parse(entity.requiredVersion);

    // 現在のバージョンより新しいバージョンが指定されているか
    final hasNewVersion = requiredVersion > currentVersion;
    // 強制アップデート有効期間内かどうか
    final isEnabled = enabledAt.compareTo(DateTime.now()) < 0;

    if (!isEnabled || !hasNewVersion) {
      // 有効期間外、もしくは新しいバージョンは無い
      return UpdateRequestType.not;
    }
    return entity.canCancel
        ? UpdateRequestType.cancelable
        : UpdateRequestType.forcibly;
  }
}

/// アップデート通知種別
enum UpdateRequestType {
  /// アップデートなし
  not,

  /// 後回しを許容するアップデートあり
  cancelable,

  /// 強制的なアップデートあり
  forcibly,
}
