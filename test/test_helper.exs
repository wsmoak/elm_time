ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ElmTime.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ElmTime.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ElmTime.Repo)

