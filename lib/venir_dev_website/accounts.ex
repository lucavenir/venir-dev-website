defmodule VenirDevWebsite.Accounts do
  use Ash.Domain, otp_app: :venir_dev_website, extensions: [AshAdmin.Domain]

  admin do
    show? true
  end

  resources do
    resource VenirDevWebsite.Accounts.Token
    resource VenirDevWebsite.Accounts.User
  end
end
