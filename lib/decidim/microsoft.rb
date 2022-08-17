# frozen_string_literal: true

require "decidim/microsoft/engine"

module Decidim
  # This namespace holds the logic of the `decidim-microsoft` module.
  module Microsoft
    include ActiveSupport::Configurable

    OMNIAUTH_PROVIDER_NAME = :azure_activedirectory_v2

    # setup a hash with :client_id, :client_secret and :site to enable omniauth authentication
    config_accessor :omniauth do
      {
        enabled: ENV["AZURE_CLIENT_ID"].present?,
        client_id: ENV["AZURE_CLIENT_ID"],
        tenant_id: ENV["AZURE_TENANT_ID"],
        client_secret: ENV["AZURE_CLIENT_SECRET"],
        icon_path: "media/images/microsoft_logo.svg"
      }
    end
  end
end
