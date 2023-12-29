# study_riverpod

Riverpod学習用のリポジトリ.

### AutoDispose修飾子で、Providerを自動破棄させる

* AutoDispose修飾子を使うとProviderがどこからも参照されなくなったタイミングで自動的に破棄される（使わないとキャッシュされている）
* 在庫を表示するようなページは開く度にProviderを再構築して欲しいので、AutoDisposeにした方が良い（しなくても`ref.refresh`で強制的に最新の情報を取得することは可能）
* アノテーションを使って自動生成する場合はデフォルトでAutoDisposeになる
* AutoDisposeにしない場合は`keepAlive`に`true`を指定する