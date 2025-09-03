defmodule VenirDevWebsiteWeb.Layouts do
  @moduledoc """
  This module holds layouts and related functionality
  used by your application.
  """
  use VenirDevWebsiteWeb, :html

  # Embed all files in layouts/* within this module.
  # The default root.html.heex file contains the HTML
  # skeleton of your application, namely HTML headers
  # and other static content.
  embed_templates "layouts/*"

  @doc """
  Renders your app layout.

  This function is typically invoked from every template,
  and it often contains your application menu, sidebar,
  or similar.

  ## Examples

      <Layouts.app flash={@flash}>
        <h1>Content</h1>
      </Layouts.app>

  """
  attr :flash, :map, required: true, doc: "the map of flash messages"

  attr :current_scope, :map,
    default: nil,
    doc: "the current [scope](https://hexdocs.pm/phoenix/scopes.html)"

  slot :inner_block, required: true

  def app(assigns) do
    ~H"""
    <style>
      /* if [data-theme] is set */
      html[data-theme="dark"] .logo-dark,
      html[data-theme="light"] .logo-light {
        display: block;
      }
      html[data-theme="dark"] .logo-light,
      html[data-theme="light"] .logo-dark {
        display: none;
      }

      /* if [data-theme] is not set use preferences */
      html:not([data-theme]) .logo-light { display: block; }
      html:not([data-theme]) .logo-dark { display: none; }
      @media (prefers-color-scheme: dark) {
      html:not([data-theme]) .logo-dark { display: block; }
      html:not([data-theme]) .logo-light { display: none; }
      }
    </style>
    <header class="navbar relative py-0 my-0 bg-base-100 flex flex-row items-center justify-between shadow-sm flex">
      <a href="/" class="max-w-32 sm:w-fit items-center gap-2">
        <img
          alt="venir dot dev logo"
          src={~p"/images/venir-dev-logo-dark.webp"}
          class="logo-dark"
        />
        <img
          alt="venir dot dev logo"
          src={~p"/images/venir-dev-logo-light.webp"}
          class="logo-light"
        />
      </a>
      <ul class="flex flex-row  gap-x-2 sm:gap-x-4 items-center justify-end">
        <li>
          <.button
            variant="primary"
            href="https://calendar.app.google/AiFNg8iPcUdrq9769"
            target="_blank"
          >
            Let's meet!
          </.button>
        </li>
        <li>
          <button
            id="nav-menu-button"
            aria-label="open main menu"
            aria-controls="nav-menu"
            aria-expanded="false"
            phx-click={JS.toggle_class("hidden", to: "#nav-menu")}
            class="btn btn-ghost"
            type="button"
          >
            <.icon name="hero-bars-3" class="size-6" />
          </button>
        </li>
        <li id="nav-menu" class="hidden absolute right-0 top-full w-48 bg-base-100 shadow-md z-50">
          <nav aria-label="Main menu">
            <ul class="flex flex-col items-end  gap-2 px-2">
              <li>
                <.link href="https://github.com/lucavenir" target="_blank">
                  GitHub
                </.link>
              </li>
            </ul>
          </nav>
        </li>
      </ul>
    </header>

    <main>
      {render_slot(@inner_block)}
    </main>

    <footer class="w-full py-8 px-4 sm:px-8 md:px-16 lg:px-32 text-center text-base-content/60 mt-auto">
      <p>&copy; 2025 Luca Venir. All rights reserved.</p>
    </footer>
    <.flash_group flash={@flash} />
    """
  end

  @doc """
  Shows the flash group with standard titles and content.

  ## Examples

      <.flash_group flash={@flash} />
  """
  attr :flash, :map, required: true, doc: "the map of flash messages"
  attr :id, :string, default: "flash-group", doc: "the optional id of flash container"

  def flash_group(assigns) do
    ~H"""
    <div id={@id} aria-live="polite">
      <.flash kind={:info} flash={@flash} />
      <.flash kind={:error} flash={@flash} />

      <.flash
        id="client-error"
        kind={:error}
        title={gettext("We can't find the internet")}
        phx-disconnected={show(".phx-client-error #client-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#client-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>

      <.flash
        id="server-error"
        kind={:error}
        title={gettext("Something went wrong!")}
        phx-disconnected={show(".phx-server-error #server-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#server-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>
    </div>
    """
  end
end
