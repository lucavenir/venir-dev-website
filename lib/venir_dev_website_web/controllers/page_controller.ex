defmodule VenirDevWebsiteWeb.PageController do
  use VenirDevWebsiteWeb, :controller

  def home(conn, _params) do
    render(conn, :home, page_title: "home")
  end
end
