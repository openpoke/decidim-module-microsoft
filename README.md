# OmniAuth::Decidim

This is the Microsoft/Azure ActiveDirectory (v2) strategy for login into Decidim using OmniAuth (SSO).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'decidim-omniauth-microsoft', git: "https://github.com/openpoke/decidim-module-omniauth-microsoft", branch: "main"
```

And then execute:

```
bundle
```

## Usage

### Register a new App in your Azure account

Follow the initial instructions stated here:

https://medium.com/committed-engineers/setup-azure-ad-oauth-2-0-with-ruby-on-rails-and-devise-39848e3ed532

### Configure the Decidim OAuth clients

By default, this strategy can be automatically configure using just these ENV vars:

```
MICROSOFT_CLIENT_ID=XXXX
MICROSOFT_TENANT_ID=XXXX
MICROSOFT_SECRET_VALUE=XXXX
MICROSOFT_SECRET_ID=XXXX
```

By setting the ENV var `MICROSOFT_CLIENT_ID` to value that's not empty, the "login with microsoft" button will appear automatically in you Decidim instance.

You can also customize the way you extract these secrets by creating a initializer file, such as:

```ruby
# config/initializers/microsoft_omniauth.rb

Decidim::Microsoft.configure do |config|
	config.omniauth = {
		enabled: Rails.application.secrets.dig(:omniauth, :microsoft, :enabled),
		client_id: Rails.application.secrets.dig(:omniauth, :microsoft, :client_id:),
		tenant_id: Rails.application.secrets.dig(:omniauth, :microsoft, :tenant_id),
		secret_value: Rails.application.secrets.dig(:omniauth, :microsoft, :secret_value),
		secret_id: Rails.application.secrets.dig(:omniauth, :microsoft, :secret_id)
	}
end
```

And, of course, having these values in your `config/secrets.yml` file.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/openpoke/decidim-module-omniauth-microsoft.

### Developing

To start contributing to this project, first:

- Install the basic dependencies (such as Ruby and PostgreSQL)
- Clone this repository

Decidim's main repository also provides a Docker configuration file if you
prefer to use Docker instead of installing the dependencies locally on your
machine.

You can create the development app by running the following commands after
cloning this project:

```bash
$ bundle
$ DATABASE_USERNAME=<username> DATABASE_PASSWORD=<password> bundle exec rake development_app
```

Note that the database user has to have rights to create and drop a database in
order to create the dummy test app database.

Then to test how the module works in Decidim, start the development server:

```bash
$ cd development_app
$ DATABASE_USERNAME=<username> DATABASE_PASSWORD=<password> bundle exec rails s
```

In case you are using [rbenv](https://github.com/rbenv/rbenv) and have the
[rbenv-vars](https://github.com/rbenv/rbenv-vars) plugin installed for it, you
can add the environment variables to the root directory of the project in a file
named `.rbenv-vars`. If these are defined for the environment, you can omit
defining these in the commands shown above.

#### Code Styling

Please follow the code styling defined by the different linters that ensure we
are all talking with the same language collaborating on the same project. This
project is set to follow the same rules that Decidim itself follows.

[Rubocop](https://rubocop.readthedocs.io/) linter is used for the Ruby language.

You can run the code styling checks by running the following commands from the
console:

```
$ bundle exec rubocop
```

To ease up following the style guide, you should install the plugin to your
favorite editor, such as:

- Atom - [linter-rubocop](https://atom.io/packages/linter-rubocop)
- Sublime Text - [Sublime RuboCop](https://github.com/pderichs/sublime_rubocop)
- Visual Studio Code - [Rubocop for Visual Studio Code](https://github.com/misogi/vscode-ruby-rubocop)

### Testing

To run the tests run the following in the gem development path:

```bash
$ bundle
$ DATABASE_USERNAME=<username> DATABASE_PASSWORD=<password> bundle exec rake test_app
$ DATABASE_USERNAME=<username> DATABASE_PASSWORD=<password> bundle exec rspec
```

Note that the database user has to have rights to create and drop a database in
order to create the dummy test app database.

In case you are using [rbenv](https://github.com/rbenv/rbenv) and have the
[rbenv-vars](https://github.com/rbenv/rbenv-vars) plugin installed for it, you
can add these environment variables to the root directory of the project in a
file named `.rbenv-vars`. In this case, you can omit defining these in the
commands shown above.

### Test code coverage

If you want to generate the code coverage report for the tests, you can use
the `SIMPLECOV=1` environment variable in the rspec command as follows:

```bash
$ SIMPLECOV=1 bundle exec rspec
```

This will generate a folder named `coverage` in the project root which contains
the code coverage report.

### Localization

If you would like to see this module in your own language, you can help with its
translation at Crowdin:

https://crowdin.com/project/decidim-module-microsoft

## License

See [LICENSE-AGPLv3.txt](LICENSE-AGPLv3.txt).
