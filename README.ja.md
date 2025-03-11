# ActiveRecordCompose Example Application

このリポジトリは gem [active_record_compopse](https://github.com/hamajyotan/active_record_compose) を使ったサンプルアプリケーションです。

- [README (engligh)](README.md)
- [README (japanense)](README.ja.md)

簡易的なマイクロポストアプリケーションです。

- ユーザ登録をするとポストできるようになります
- 無条件に、他者のポストも参照できます
- ユーザ間のフォロー機能などはありません
- なお、 development では実際のメール送信はしません。 [letter_opener_web](https://rubygems.org/gems/letter_opener_web) でメール送信を模倣しています。

![](doc/micropost-application.gif)

# 起動方法

一般的な Rails アプリケーションなので `bin/setup --skip-server` および `bin/rails s` で起動できます。
vscode devcontainer での起動も可能です。
また、ローカル開発環境でなくとも GitHub Codespaces でも開発環境を動かすことができます。

## codespace で開く

ActiveRecordCompose Example は Template repository であり、そのまま codespace で開発環境を開くことができます。
https://github.com/hamajyotan/active_record_compose-sample から `Use this template` > `Open in a codespace` により codespace をそのまま開くことができます。

codespace で開いた後は [README.codespaces.ja.md](README.codespaces.ja.md) を参照ください。

![](doc/open-in-a-codespace.png)

# プログラムコードについて

`app/models/*` にいくつかのモデル定義が存在しています。
そのなかで、以下のファイルは `ApplicationRecord` をスーパークラスとするモデルです。

- `User`
- `UserCredential`
- `UserProfile`
- `UserRegistration`
- `UserResignation`
- `Post`

`app/models/*` の上記以外のファイルは `ActiveRecordCompose::Model` をスーパークラスとするモデルであり、
gem [active_record_compopse](https://github.com/hamajyotan/active_record_compose) の用例となっています。

## E-R Diagram

```mermaid
erDiagram
  users |o..|| user_registrations : ""
  users ||--o| user_credentials : has
  users ||--o| user_profiles : has
  users ||--o| user_resignations : resign
  users ||--o{ posts : makes

  posts {
    integer id PK
    references user FK
    string content
    timestamp created_at
    timestamp deleted_at
  }

  user_credentials {
    integer id PK
    references user FK
    string email
    string password_digest
    string token
    timestamp created_at
    timestamp deleted_at
  }

  user_profiles {
    integer id PK
    references user FK
    string name
    string lang
    timestamp created_at
    timestamp deleted_at
  }

  user_registrations {
    integer id PK
    references user FK
    string email
    string token
    timestamp expires_at
    timestamp created_at
    timestamp deleted_at
  }

  user_resignations {
    integer id PK
    references user FK
    string reason
    timestamp created_at
    timestamp deleted_at
  }

  users {
    integer id PK
    timestamp created_at
    timestamp deleted_at
  }
```
