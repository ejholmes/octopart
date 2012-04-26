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

Find a part by it's octopart ID.

```ruby
Octopart::Part.find('39619421')
# => <Octopart::Part>
```

**#search**

Search all parts that match a given query string.

```ruby
Octopart::Part.search('resistor')
# => [<Octopart::Part>, ... ]

Octopart::Part.search('resistor', limit: 10)
# => [<Octopart::Part>, ... ]
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
# => [<Octopart::Part>, ... ]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
