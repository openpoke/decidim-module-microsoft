# frozen_string_literal: true

require "spec_helper"

describe "Login page", type: :system do
  let!(:organization) { create :organization }

  before do
    switch_to_host(organization.host)
  end

  shared_examples "does not show the login button" do
    it "has no button" do
      visit decidim.new_user_session_path

      expect(page).not_to have_content "Sign in with Azure"
    end
  end

  shared_examples "shows the login button" do
    it "has button" do
      visit decidim.new_user_session_path

      expect(page).to have_content "Sign in with Azure"
    end
  end

  if ENV["AZURE_CLIENT_ID"].blank?
    puts "AZURE_CLIENT_ID env is not speficied, button must not exist"
    puts "to check for a existing button, run:"
    puts "AZURE_CLIENT_ID=dummy bundle exec rspec spec"
    it_behaves_like "does not show the login button"
  else
    puts "AZURE_CLIENT_ID env is speficied, button must exist"
    puts "to check for a missing button, run:"
    puts "AZURE_CLIENT_ID= bundle exec rspec spec"
    it_behaves_like "shows the login button"
  end
end
