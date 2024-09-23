# frozen_string_literal: true

require_relative "lib/rspec_pacman/version"

Gem::Specification.new do |spec|
  spec.name = "rspec_pacman"
  spec.version = RspecPacman::VERSION
  spec.authors = ["topoi"]
  spec.email = [""]

  spec.summary = "RSpecの実行表示がパックマンっぽくなるGem"
  spec.description = "RSpecの実行表示がパックマンっぽくなるGem"
  spec.homepage = "https://github.com/topi0247/rspec_pacman"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://github.com/topi0247/rspec_pacman"

  spec.metadata["homepage_uri"] = "https://github.com/topi0247/rspec_pacman"
  spec.metadata["source_code_uri"] = "https://github.com/topi0247/rspec_pacman"
  spec.metadata["changelog_uri"] = "https://github.com/topi0247/rspec_pacman/blob/main/CHANGELOG.md"

  spec.files = Dir["lib/**/*.rb"]
  spec.add_development_dependency "rspec"

end
