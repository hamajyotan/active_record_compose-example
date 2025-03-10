# ActiveRecordCompose Example Application

ActiveRecordCompose Example is a template repository, allowing you to open a development environment in Codespaces as is.
You can open a Codespace directly by navigating to https://github.com/hamajyotan/active_record_compose-sample and selecting `Use this template` > `Open in a codespace`.

![](doc/open-in-a-codespace.png)

After opening the Codespace, you will see a confirmation in the console once the setup is complete.

![](doc/finished-configuring-codespace.png)

From the console, you can start the application as a normal Rails app using the `bin/rails s` command.

![](doc/bin-rails-server.png)

At this stage, the port is not exposed externally for security reasons.
To allow access, navigate to `PORTS` > `Visibility`, open the menu at the `Private` setting, and change `Port Visibility` to `Public`.

![](doc/change-port-visibility-to-public.png)

You can now access the application from the `Forwarded Address` URL.

![](doc/forwarded-address.png)

When opening the link in a new window for the first time, a warning message will appear. Click `Continue` to proceed.
別のウィンドウからリンク先をひらくと、はじめの1回は警告表示されます。 `Continue` を応答します。

![](doc/port-visibility-warn.png)

After clicking `Continue`, you should see the application running successfully.

![](doc/application-was-able-to-start.png)

By default, the container is automatically deleted, but if needed, you can manually delete it from https://github.com/codespaces .

![](doc/stop-codespaces.png)
