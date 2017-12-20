# GiphyRB
[![Gem Version](https://badge.fury.io/rb/giphyrb.svg)](https://badge.fury.io/rb/giphyrb)
## Installation

Add this line to your application's Gemfile:

    gem 'giphyrb'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install giphyrb

## Usage

Create a Giphy object with
```ruby
giphy = GiphyRB::Giphy.new api_key: 'YOUR_API_KEY'
```
Now, you can use it to get some gifs

#### Trending
````ruby
giphy.trending(limit=5, offset=0, rating='g')
=> GiphyRB::Responses::Trending
````

#### Translate
````ruby
Giphy.translate(string)
=> GiphyRB::Responses::Translate
````

#### Search
````ruby
Giphy.search(query, limit=5, offset=0, rating='g', lang=nil)
=> GiphyRB::Responses::Search
````

#### Random
````ruby
Giphy.random(tag=nil, rating='g')
=> GiphyRB::Responses::Random
````

#### GIF by ID
````ruby
Giphy.from_id(id)
=> GiphyRB::Response
````

#### GIFs by IDs
````ruby
Giphy.from_ids(ids=[])
=> GiphyRB::Response
````

## License

See [LICENSE](https://github.com/Whaxion/giphyrb/blob/master/LICENSE) for details.