require "rails/generators"

# Sorcery 0.12.0 has a bug where it doesn't copy migrations
# for Rails 5.2 because it can't detect ActiveRecord
#
# This has been fixed on master, but a new Sorcery release hasn't
# been made yet.
#
# Delete this when sorcery version is > 0.12.0

module Sorcery
  module Generators
    class InstallGenerator < Rails::Generators::Base
      ActiveRecord = ActiveRecord
    end
  end
end
