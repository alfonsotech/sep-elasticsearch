# Sep::Elasticsearch

This library crawls the Stanford Enclyclopedia of Philosophy and indexes its
content in Elasticsearch.

## Installation

Clone this repo to your workstation.

So that your dev machine matches the docker environment, add an entry to your `/etc/hosts` file

```
sudo echo 'localhost elasticsearch >> /etc/hosts
```

## Usage

After cloning the repo, you can start the data ingestion process with

```
RACK_ENV=production bin/foreman start
```

At the moment, the entire SEP is consumed. See the appendix for clarification

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing

You can run the rubocop linter and rspec test suite with

```
bin/test
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/repurpose/sep-elasticsearch.

## TODO

- [ ] Use the RSS feed [described here](http://plato.stanford.edu/new.html) for ingestion of updates [1]

## Appendix

1. The ingestion of the entire SEP should be used for bootstrapping/disaster
   recovery. Ingestion of updates using an RSS feed can be found in the TODOs
