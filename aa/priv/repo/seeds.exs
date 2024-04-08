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
alias Aa.Trips.Trip
alias Aa.UserTripRoles.UserTripRole
alias Aa.Repo

user = Repo.insert!(%User{email: "test@gmail.com", hashed_password: "Test123#4222"})

trip =
  Repo.insert!(%Trip{
    name: "Explore the Grand Canyon",
    description: "A week-long trek through the Grand Canyon with guided tours and rafting.",
    destination: "Grand Canyon, Arizona, USA",
    private: true,
    start_date: ~N[2024-05-01 08:00:00],
    end_date: ~N[2024-05-08 20:00:00],
    created_by_user_id: user.id
  })

_user_trip_role = Repo.insert!(%UserTripRole{user_id: user.id, trip_id: trip.id, trip_role_id: 2})
