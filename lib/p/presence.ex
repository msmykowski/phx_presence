defmodule P.Presence do
  use Phoenix.Presence, otp_app: :p, pubsub_server: P.PubSub
end
