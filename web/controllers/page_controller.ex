defmodule PhoenixExamples.PageController do
  use PhoenixExamples.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
