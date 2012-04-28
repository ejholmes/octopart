# Octopart [![travis-ci](https://secure.travis-ci.org/ejholmes/octopart.png)](https://secure.travis-ci.org/ejholmes/octopart)

This is a ruby gem that wraps the [Octopart API](http://octopart.com/api/documentation).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'octopart'
```

And then execute:

```bash
$ bundle
```

Or, install it manually:

```bash
$ gem install octopart
```

## Usage

### Configuration

In order to make more than 100 requests/hour you need to [register](http://octopart.com/api/signin?continue_to=http%3A//octopart.com/api/register)
your application with Octopart and obtain your API key. Once you have your API key, you can set it like so.

```ruby
Octopart.configure do |config|
  config.apikey = 'your api key'
end
```

### Parts

* * *

**#find**

Find a part by it's octopart ID.

```ruby
part = Octopart::Part.find(39619421)
# => <Octopart::Part >

part.short_description
# => "Dial; Turns-Counting, Analog; 20 Turns; 100per Turn; Shaft Dia 0.25in"

part.mpn
# => "H-46-6A"

parts = Octopart::Part.find(39619421, 29035751, 31119928)
# => [<Octopart::Part >, ... ]
```

* * *

**#search**

Search all parts that match a given query string.

```ruby
Octopart::Part.search('resistor')
# => [<Octopart::Part >, ... ]

Octopart::Part.search('resistor', limit: 10)
# => [<Octopart::Part >, ... ]
```

* * *

**#match**

Match (manufacturer name, mpn) to part uid.

```ruby
Octopart::Part.match('texas instruments', 'SN74LS240N')
# => 42315325996
```

* * *

**#bom**

Return an array of parts for each line specified.

```ruby
Octopart::Part.bom(mpn: 'SN74LS240N')
# => [[<Octopart::Part >, ... ]]

Octopart::Part.bom([{mpn: 'SN74LS240N'}, {mpn: 'ATMEGA328P-PU'}])
# => [[<Octopart::Part >, ... ], [<Octopart::Part >, ... ]]
```

* * *

**.datasheet**

Returns the highest rated datasheet for the part, or nil if there are no
datasheets.

```ruby
part = Octopart::Part.find(39619421)
# => <Octopart::Part >

part.datasheet
# => http://datasheet.octopart.com/H-46-6A-Bourns-datasheet-12570.pdf
```

* * *

Returns the best offer (lowest price) for the quantity specified.

**.best_offer**

```ruby
part = Octopart::Part.find(39619421)
# => <Octopart::Part >

part.best_offer
# => #<Hashie::Mash >

part.best_offer.prices
# => [[1, 14.67, "USD"], [10, 13.69, "USD"], [30, 12.84, "USD"]]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
