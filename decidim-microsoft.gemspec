
# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "decidim/microsoft/version"

Gem::Specification.new do |spec|
  spec.name = "decidim-microsoft"
  spec.version = Decidim::Microsoft::VERSION
  spec.authors = ["Ivan Vergés"]
  spec.email = ["ivan@pokecode.net"]

  spec.summary = "OmniAuth strategy for microsoft"
  spec.description = "OmniAuth strategy for microsoft"
  spec.license = "AGPL-3.0"
  spec.homepage = "https://github.com/openpoke/decidim-module-microsoft"
  spec.required_ruby_version = ">= 2.7"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "decidim-core", Decidim::Microsoft::COMPAT_DECIDIM_VERSION
  spec.add_dependency "omniauth-azure-activedirectory-v2", "~> 1.0"
 
  spec.add_development_dependency "decidim-dev", Decidim::Microsoft::COMPAT_DECIDIM_VERSION
end