
# TablerIcons

Welcome to the TablerIcons gem! This is a Rails gem that allows you to easily incorporate the awesome [Tabler Icons](https://tabler-icons.io/) into your Rails project.

## Prerequisites

This gem is designed to work with Rails. Make sure you have Rails installed in your environment before proceeding.

## Installation

To install this gem, you have two options:

1. Add this line to your application's Gemfile:

```ruby
gem 'tabler_icons'
```

Then execute:

```bash
$ bundle install
```

2. Or install it directly using:

```bash
$ gem install tabler_icons
```

## Usage

After installing the gem, you can use the `tabler_icon` helper in your Rails views to easily add Tabler icons. The `tabler_icon` helper takes the name of the icon as a symbol. Here's an example:

```ruby
<%= link_to new_user_path do %>
  <%= tabler_icon :circle_plus %>
  <span>New User</span>
<% end %>
```

In this example, we're creating a link to the `new_user_path`. Inside the link, we use the `tabler_icon` helper to add a "circle plus" icon, followed by the text "New User".

You can replace `:circle_plus` with the name of any icon from the [Tabler Icons](https://tabler-icons.io/) library.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to rubygems.org.

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/Greyoxide/tabler_icons](https://github.com/Greyoxide/tabler_icons).

## License

The gem is available as open source under the terms of the MIT License.

Please note that the above usage example is based on the ERB templating system. If you're using a different templating system like Haml, the syntax might be slightly different.