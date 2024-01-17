# study_riverpod

Riverpod学習用のリポジトリ.

## ref.refresh/invalidateでプロバイダを更新し、最新の値を得る

* `refresh`=`invalidate`+`read`と言うことらしい（refreshの実装もそうなっている）
* `ref.refresh`の戻り値を使用せず、`await`もする必要がない場合は、`ref.invalidate`を使用した方が良いとのこと
