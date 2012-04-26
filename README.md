# Octopart

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'octopart'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install octopart

## Usage

### Parts

**#find**

```ruby
# Find a part by it's octopart ID
Octopart::Part.find('39619421')
```

**#search**

```ruby
# Search all parts that match a given query string
Octopart::Part.search('resistor')

Octopart::Part.search('resistor', limit: 10)
```

**#match**

```ruby
# Match (manufacturer name, mpn) to part uid
Octopart::Part.match('texas instruments', 'SN74LS240N')
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
