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
        client_id: nil,
        client_secret: nil,
        site: nil
      }
    end
	end
end
