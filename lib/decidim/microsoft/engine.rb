# frozen_string_literal: true

require "omniauth/microsoft"

module Decidim
  module Microsoft
    # This is the engine that runs on the public interface of decidim-microsoft.
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::Microsoft

      initializer "decidim_microsoft.omniauth" do
        next unless Decidim::Microsoft.omniauth && Decidim::Microsoft.omniauth[:client_id]

        Rails.application.config.middleware.use OmniAuth::Builder do
          provider Decidim::Microsoft::OMNIAUTH_PROVIDER_NAME,
                   client_id: Decidim::Microsoft.omniauth[:client_id],
                   client_secret: Decidim::Microsoft.omniauth[:client_secret],
                   site: Decidim::Microsoft.omniauth[:site],
                   scope: "openid profile email"
        end
      end
    end
  end
end
