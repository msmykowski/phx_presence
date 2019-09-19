defmodule P.Sessions do
  alias P.Session

  def create(id, topic) do
    Session.start(%{id: id, topic: topic})
  end

  def active_users(topic) do
    topic
    |> P.Presence.list()
    |> Map.keys()
    |> length()
  end
end
