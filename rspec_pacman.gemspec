# frozen_string_literal: true

require_relative "lib/rspec_pacman/version"

Gem::Specification.new do |spec|
  spec.name = "rspec_pacman"
  spec.version = RspecPacman::VERSION
  spec.authors = ["topi"]
  spec.email = ["karubona.ra247@gmail.com"]

  spec.summary = "Gem that makes RSpec execution display look like Pacman"
  spec.description = "This is a Gem that makes the display while running RSpec look like Pacman."
  spec.homepage = "https://github.com/topi0247"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/topi0247/rspec_pacman"
  spec.metadata["changelog_uri"] = "https://github.com/topi0247/rspec_pacman/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.files = Dir["lib/**/*.rb"]
  spec.add_development_dependency "rspec", "~> 3.0"
end
