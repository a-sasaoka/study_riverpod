# study_riverpod

Riverpod学習用のリポジトリ.

## 再描画の範囲を検証する

* ConsumerWidgetはwatchしているプロバイダーの状態が変わるとbuildメソッドが呼び出される
* ConsumerStatefulWidget（ConsumerState）もbuildメソッドが呼び出される
* Consumerを使用するとbuildメソッドは呼び出されずにConsumerだけが呼び出される（再描画の範囲を局所化できる）
* pushで画面遷移した場合、遷移元のbuildメソッド、Consumerも呼び出される
