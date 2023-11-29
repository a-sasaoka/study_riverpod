# study_riverpod

Riverpod学習用のリポジトリ.

### NotifierProviderで「状態」を購読・複雑に操作する

* `@riverpod`アノテーションを付けて状態を管理するクラスを定義する
* `_${クラス名}`を継承する
* `build`メソッドをオーバーライドする
* 状態を変更するメソッドを定義する
  * 変更した内容を`state`に設定する