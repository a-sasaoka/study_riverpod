# study_riverpod

Riverpod学習用のリポジトリ.

## riverpod_generatorを使用してProviderの生成を試す

感覚を掴むために必要最低限のことだけやってみる

* test_provider.dartのように`@riverpod`アノテーションを付けてProviderを定義する
* `dart run build_runner build`を実行すると必要なコードが生成される
* `dart run build_runner watch`を実行すると監視が始まり、ソースコードを変更すると再生成してくれる
