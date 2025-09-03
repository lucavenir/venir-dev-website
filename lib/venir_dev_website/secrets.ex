defmodule VenirDevWebsite.Secrets do
  use AshAuthentication.Secret

  def secret_for(
        [:authentication, :tokens, :signing_secret],
        VenirDevWebsite.Accounts.User,
        _opts,
        _context
      ) do
    Application.fetch_env(:venir_dev_website, :token_signing_secret)
  end
end
