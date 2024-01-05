# study_riverpod

Riverpod学習用のリポジトリ.

### ProviderScopeでの状態上書きを使った書き方

* ProviderScopeで囲むことで特定のWidgetに値を上書きしたProviderを渡すことができる
* ProviderScopeの内と外でProviderは別々に管理される（それぞれ別の状態を保持する）