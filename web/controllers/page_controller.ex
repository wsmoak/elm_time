defmodule ElmTime.PageController do
  use ElmTime.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
