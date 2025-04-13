# ActiveRecordCompose Example Application

以下のリンクから GitHub Codespaces で開けます

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/hamajyotan/active_record_compose-example)

リンク押下後、 `Create new codespace` から起動できます。

![](doc/create-codespace.png)

codespace を起動してしばらくすると、コンソールでセットアップが完了することが確認できます。

![](doc/finished-configuring-codespace.png)

なお、起動処理の途中 steep エクステンションの初期化でエラーが生じたり、 ruby-lsp により migration が未実施であることが通知されますがこれは一時的なものです。
セットアッププロセス `bin/setup` の中でこの問題は解決されるのでそのまま応答しなくても問題ありません。
(また、ダイアログ表示時点で `Run Migrations` を応答しても悪影響はありません)

![](doc/steep-initialization-error.ja.png)

![](doc/migrations-are-pending.ja.png)

コンソールから通常の Rails アプリケーションとして `bin/rails s` コマンドで起動できます。

![](doc/bin-rails-server.png)

起動すると、 3000番ポートを公開するか否かを問われるダイアログが表示されます。
特段応答する必要はないのですが、`公開用にする` を応答すると GitHub にログインしている自身以外のユーザもアクセス可能になります。

![](doc/port-visibility-dialog.ja.png)

`Private` のままでも自身による操作であれば本来アクセス可能なのですが、開始直後は GitHub Codespaces のバグと思われる挙動によりまだアクセスできません。更に以下の操作が必要です。

* `ポート` > `表示範囲` から `Private` に設定されている箇所でメニューを開き、 `ポートの表示範囲` > `Public` に変更します。
* 更に同様の要領で、今度は `Public` から `Private` に戻します。

(この挙動については以下にレポートしており、解決次第この内容も整理する予定です)

[Port forwarding does not work on first boot unless port visibility is toggled in GitHub Codespaces](https://github.com/orgs/community/discussions/156546)

![](doc/change-port-visibility-to-public.ja.png)

`転送されたアドレス` にある URL からアプリケーションの動作を確認できます。

![](doc/forwarded-address.ja.png)

アプリケーションの動作が確認できます。

![](doc/application-was-able-to-start.png)

基本的には codespace は自動削除されますが、気になる場合は直接 https://github.com/codespaces から削除することができます。

![](doc/stop-codespaces.png)
