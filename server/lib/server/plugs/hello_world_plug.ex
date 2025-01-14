defmodule Server.HelloWorldPlug do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do # return of init passed to call
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello world! \n")
  end
end
