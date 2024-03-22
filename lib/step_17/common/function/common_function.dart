import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:study_riverpod/step_17/controller/update_request_controller.dart';

/// バージョンアップダイアログを表示
void showVersionUppDialog(
  BuildContext context,
  UpdateRequestType requestType,
  WidgetRef ref,
) {
  // 新しいアプリバージョンあり、かつキャンセルしていない場合はダイアログを表示する
  if (requestType != UpdateRequestType.not &&
      !ref.read(cancelControllerProvider)) {
    showDialog<void>(
      context: context,
      // ダイアログの外をタップしても閉じられないようにする
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          // AndroidのBackボタンで閉じられないようにする
          canPop: false,
          child: AlertDialog(
            title: const Text('最新の更新があります。\nアップデートをお願いします。'),
            actions: [
              if (requestType == UpdateRequestType.cancelable)
                TextButton(
                  onPressed: () {
                    ref.read(cancelControllerProvider.notifier).clickCancel();
                    Navigator.of(context).pop();
                  },
                  child: const Text('キャンセル'),
                ),
              TextButton(
                onPressed: () {
                  // 本来であればここにStoreに飛ばす処理を書く
                  Navigator.of(context).pop();
                },
                child: const Text('アップデート'),
              ),
            ],
          ),
        );
      },
    );
  }
}
