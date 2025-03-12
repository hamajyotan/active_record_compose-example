# ActiveRecordCompose Example Application

ActiveRecordCompose Example は Template repository であり、そのまま codespace で開発環境を開くことができます。
https://github.com/hamajyotan/active_record_compose-example から `Use this template` > `Openin a codespace` により codespace をそのまま開くことができます。

![](doc/open-in-a-codespace.png)

codespace を開いてしばらくすると、コンソールでセットアップが完了することが確認できます。

![](doc/finished-configuring-codespace.png)

コンソールから通常の Rails アプリケーションとして `bin/rails s` コマンドで起動できます。

![](doc/bin-rails-server.png)

この時点ではセキュリティのためにポートは外部解放されていません。
`PORTS` > `Visibility` から `Private` に設定されている箇所でメニューを開き、 `Port Visibility` > `Public` に変更します。

![](doc/change-port-visibility-to-public.png)

`Frowarded Address` にある URL からアプリケーションの動作を確認できます。

![](doc/forwarded-address.png)

別のウィンドウからリンク先をひらくと、はじめの1回は警告表示されます。 `Continue` を応答します。

![](doc/port-visibility-warn.png)

`Continue` 応答後、アプリケーションの動作が確認できます。

![](doc/application-was-able-to-start.png)

基本的にはコンテナは自動削除されますが、気になる場合は直接 https://github.com/codespaces から削除することができます。

![](doc/stop-codespaces.png)
