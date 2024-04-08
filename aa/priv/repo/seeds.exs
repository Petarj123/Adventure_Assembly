# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Aa.Repo.insert!(%Aa.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Aa.Accounts.User

Aa.Repo.insert!(%User{email: "test@gmail.com", hashed_password: "Test123#4222"})
