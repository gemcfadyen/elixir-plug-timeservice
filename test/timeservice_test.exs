defmodule TimeserviceTest do
  use ExUnit.Case
  use Plug.Test
  alias TimeService.Router

  @opts Router.init([])

 test "unsupported endpoints respond with 404" do
   conn = conn(:get, "/unsupported")

   response = Router.call(conn, @opts)

   assert response.status == 404
 end

  test "endpoint responds succesfully" do
    conn = conn(:get, "/datetime")

    response = Router.call(conn, @opts)

    assert response.status == 200
  end

  test "endpoint responds with current local datetime" do
    {:ok, current_datetime_json} = CurrentDateTime.get |> Poison.encode
    conn = conn(:get, "/datetime")

    response = Router.call(conn, @opts)

    assert response.status == 200
    assert response.resp_body == current_datetime_json
  end
end
