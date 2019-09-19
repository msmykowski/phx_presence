defmodule P.Session do
  use GenServer
  alias P.Presence

  @expiration 300_000

  def start(%{id: id, topic: topic} = opts) do
    GenServer.start(__MODULE__, opts)
  end

  def init(%{id: id, topic: topic} = opts) do
    Presence.track(self(), topic, id, %{id: id})
    Process.send_after(self(), :expire, @expiration)
    {:ok, opts, :hibernate}
  end

  def handle_info(:expire, %{id: id, topic: topic} = state) do
    Presence.untrack(self(), topic, id)
    {:stop, :normal, state}
  end
end
