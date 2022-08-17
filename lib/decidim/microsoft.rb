# frozen_string_literal: true

require "decidim/microsoft/engine"

module Decidim
  # This namespace holds the logic of the `decidim-microsoft` module.
	module Microsoft
  	include ActiveSupport::Configurable

  	OMNIAUTH_PROVIDER_NAME = "azure_activedirectory_v2"

  	# setup a hash with :client_id, :client_secret and :site to enable omniauth authentication
    config_accessor :omniauth do
      {
        enabled: ENV["MICROSOFT_CLIENT_ID"].present?,
        client_id: ENV["MICROSOFT_CLIENT_ID"],
        tenant_id: ENV["MICROSOFT_TENANT_ID"],
        secret_value: ENV["MICROSOFT_SECRET_VALUE"],
        secret_id: ENV["MICROSOFT_SECRET_ID"]
      }
    end
	end
end
