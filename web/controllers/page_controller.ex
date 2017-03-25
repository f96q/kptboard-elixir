defmodule Kptboard.PageController do
  use Kptboard.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
