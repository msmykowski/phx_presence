defmodule PWeb.SessionController do
  use PWeb, :controller
  alias P.Sessions

  @ids 1..100

  def create(conn, %{"topic" => topic}) do
    id = Integer.to_string(Enum.random(@ids))

    {:ok, pid} = Sessions.create(id, topic)

    json(conn, %{
      active_users: Sessions.active_users(topic),
    })
  end
end
