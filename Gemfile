source "https://rubygems.org"
ruby file: ".ruby-version"

gemspec

gem "rake"
gem "minitest"
gem "tapioca", require: false, group: [:development, :test]

group :development do
  gem "sorbet"
  gem "sorbet-runtime"
  gem "ruby-lsp", require: false
  gem "activesupport"
  gem "activerecord"
  gem "activejob"
end
