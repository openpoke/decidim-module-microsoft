# frozen_string_literal: true

require "omniauth/strategies/azure_activedirectory_v2"

module Decidim
  module Microsoft
    # This is the engine that runs on the public interface of decidim-microsoft.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Microsoft

      initializer "decidim_microsoft.omniauth" do
        next unless Decidim::Microsoft.omniauth.present? && Decidim::Microsoft.omniauth[:enabled]

        Rails.application.config.middleware.use OmniAuth::Builder do
          provider Decidim::Microsoft::OMNIAUTH_PROVIDER_NAME, Decidim::Microsoft.omniauth
        end

        # Force Decidim to look at this provider if not defined in secrets.yml
        if Rails.application.secrets.dig(:omniauth, Decidim::Microsoft::OMNIAUTH_PROVIDER_NAME).blank?
          Rails.application.secrets[:omniauth][Decidim::Microsoft::OMNIAUTH_PROVIDER_NAME] = Decidim::Microsoft.omniauth
        end
      end

      initializer "decidim_microsoft.webpacker.assets_path" do
        Decidim.register_assets_path File.expand_path("app/packs", root)
      end
    end
  end
end
