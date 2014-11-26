# Peek::ActiveRecordQuery

Uses Active Support Instrumentation to monitor queries and displays the queries
per request and total query duration in [Peek](https://github.com/peek/peek).

![peek-active_record-query](https://cloud.githubusercontent.com/assets/86003/5198533/228698a2-7507-11e4-9c7a-004db0d42b06.png)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'peek-active_record-query'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install peek-active_record-query

## Usage

Add the following to your `config/initializers/peek.rb`:

```ruby
Peek.into Peek::Views::ActiveRecordQuery
```

Optionally include the `peek/views/active_record_query` JavaScript file in your
application to lists requests using `console.table` and expose the request log
as 'window.active_record_query'. In `app/assets/javascripts/application.coffee`:

```coffeescript
#= require peek/views/active_record_query
```

## Contributing

1. Fork it ( https://github.com/jonah-williams/peek-active_record-query/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
