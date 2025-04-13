# ActiveRecordCompose Example Application

you can open it from the following link:

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/hamajyotan/active_record_compose-example)

After clicking the link, you can start it from `Create new codespace`.

![](doc/create-codespace.png)

After starting the Codespace, you will see a confirmation in the console once the setup is complete.

![](doc/finished-configuring-codespace.png)

During the startup process, you may temporarily encounter errors during the initialization of the Steep extension or receive notifications from ruby-lsp indicating that migrations have not been performed. However, this is only a temporary issue.
This issue will be resolved as part of the setup process (`bin/setup`), so you can safely ignore it.
(Additionally, responding with `Run Migrations` when the dialog appears will not cause any problems.)

![](doc/steep-initialization-error.png)

![](doc/migrations-are-pending.png)

From the console, you can start the application as a normal Rails app using the `bin/rails s` command.

![](doc/bin-rails-server.png)

When launching, a dialog will appear asking whether to expose port 3000.
You do not need to select anything in particular, but if you select `Make Public`,  Users other than yourself who are logged in to GitHub will be able to access it.

![](doc/port-visibility-dialog.png)

You can still access it as `Private` by yourself, but right after you start, you can't access it yet due to a behavior that seems to be a bug in GitHub Codespaces. You need to do the following

* Go to `PORTS` > `Visibility`, open the menu where it is set to `Private`, and change `Port Visibility` to `Public`.
* In the same way, change it back from `Public` to `Private` this time.

(This behavior is reported below, and this content will be sorted out as soon as it is resolved.)

[Port forwarding does not work on first boot unless port visibility is toggled in GitHub Codespaces](https://github.com/orgs/community/discussions/156546)

![](doc/change-port-visibility-to-public.png)

You can now access the application from the `Forwarded Address` URL.

![](doc/forwarded-address.png)

you should see the application running successfully.

![](doc/application-was-able-to-start.png)

By default, the codespace is automatically deleted, but if needed, you can manually delete it from https://github.com/codespaces .

![](doc/stop-codespaces.png)
