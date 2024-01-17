# study_riverpod

Riverpod学習用のリポジトリ.

## FutureProviderで非同期処理を購読する

* API呼び出し等のHTTP/HTTPSリクエストやファイルの読み取りなどの非同期（Future）を扱う場合に使用する
* Providerから取得できる方は`AsyncValue<T>`になる
* `AsyncValue<T>`には`loading`、`error`、`data`の3つの状態が存在するので、状態に合わせた処理が可能
