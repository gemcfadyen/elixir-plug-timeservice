defmodule TimeService.Router do
  use Plug.Router
  require Logger

  plug Plug.Logger
  plug :match
  plug :dispatch

  def init(options) do
    options
  end

  def start_link, do: run

  def run do
    {:ok, _} = Plug.Adapters.Cowboy.http(__MODULE__, [])

    #    port = :ranch.get_port(TimeService.Router.HTTP)
    #    IO.puts("Timeservice started on port #{port}")
  end

  get "/datetime" do
    {:ok, current_datetime_json} = TimeService.CurrentDateTime.get |> Poison.encode
    send_resp(conn, 200, current_datetime_json)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
