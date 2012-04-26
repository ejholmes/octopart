# Octopart

This is a ruby gem that wraps the [Octopart API](http://octopart.com/api/documentation).

## Installation

Add this line to your application's Gemfile:

    gem 'octopart'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install octopart

## Usage

### Configuration

```ruby
Octopart.configure do |config|
  config.apikey = 'your api key'
end
```

### Parts

**#find**

Find a part by it's octopart ID.

```ruby
part = Octopart::Part.find('39619421')
# => <Octopart::Part >

part.short_description
# => "Dial; Turns-Counting, Analog; 20 Turns; 100per Turn; Shaft Dia 0.25in"

part.mpn
# => "H-46-6A"
```

**#search**

Search all parts that match a given query string.

```ruby
Octopart::Part.search('resistor')
# => [<Octopart::Part >, ... ]

Octopart::Part.search('resistor', limit: 10)
# => [<Octopart::Part >, ... ]
```

**#match**

Match (manufacturer name, mpn) to part uid.

```ruby
Octopart::Part.match('texas instruments', 'SN74LS240N')
# => 42315325996
```

**#bom**

Return an array of parts that match the criteria

```ruby
Octopart::Part.bom(mpn: 'SN74LS240N')
# => [<Octopart::Part >, ... ]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
