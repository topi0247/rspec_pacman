# RspecPacman
This is a Gem that displays the test execution status displayed on the terminal like Pac-Man in RSpec tests.\
It supports Ruby or Rails apps.

## Installation
Write the following in the test group of the Gemfile
```gemfile
gem 'rspec_pacman'
```
Or, you can put them in the test group individually.
```gemfile
gem 'rspec_pacman', group: :test
```
Then execute the following command
```bash
bundle install
```

## Usage
For Ruby apps, add the following to spec_helper.rb
```rb
require "rspec_pacman" # add

RSpec.configure do |config|
  config.formatter = RspecPacman::PacmanFormatter # add
end
```

For a Rails app, add the following to rails_helper.rb\
Some descriptions are omitted.
```rb
require "rspec_pacman" # add

RSpec.configure do |config|
  config.formatter = RspecPacman::PacmanFormatter # add
end
```
If you are using another formatter, try writing the following It may display well.
```rb
RSpec.configure do |config|
  config.formatters.clear # add
  config.formatter = RspecPacman::PacmanFormatter
end
```
After configuration is complete, run Rspec.
```bash
bundle exec rspec
```
It is assumed to be displayed as follows\
<img src="https://i.gyazo.com/428a4cc5423aecbc8d264139a20abd67.gif" width="400px" />

The results of the test will be displayed as follows\
<img src="https://i.gyazo.com/83557196d4abfb8b649d06ee0bd690b3.png" width="400px" />

# License
This Gem is provided under the MIT License.