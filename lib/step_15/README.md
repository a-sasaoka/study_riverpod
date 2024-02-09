# study_riverpod

Riverpod学習用のリポジトリ.

## StateNotifierProviderでTheme(ライト・ダーク)を切り替える

* テーマ切り替えのサンプルにもなっている
* 選択されたテーマを保存するため、Provider内でstep_14で作成したProviderを利用している（Provider内で別のProviderを参照するサンプル）
* enumの画面に表示するテーマ名をカスタマイズしたいのでenumの拡張（extension）を使用している
