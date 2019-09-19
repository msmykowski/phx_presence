defmodule PWeb.Router do
  use PWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PWeb do
    pipe_through :api

    get "/session/:topic", SessionController, :create
  end
end
