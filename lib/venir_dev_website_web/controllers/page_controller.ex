defmodule VenirDevWebsiteWeb.PageController do
  use VenirDevWebsiteWeb, :controller

  def home(conn, _params) do
    render(conn, :home,
      page_title: "home",
      page_description: "~venir's personal website, an business-minded software engineer"
    )
  end
end
