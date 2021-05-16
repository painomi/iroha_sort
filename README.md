# IrohaSort

独自の「いろは」を元に、いろは順ソートをする

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'iroha_sort'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install iroha_sort

## Usage

```ruby
iroha= "いろはにほへと ちりぬるを わかよたれそ つねならむ うゐのおくやま けふこえて あさきゆめみし ゑひもせす".gsub(/\s/,'')
iroha_comparator= IrohaSort::Comparator.new(iroha)
targets= ["いさわ", "かわかみ", "かわむら", "すかい", "ふくら", "やまもと", "わたなへ"]
targets.sort!{|a, b| iroha_comparator.compare(a, b)}
```

## Development

### 開発環境

```
$ docker-compose build
```

### テスト実行

```
$ docker run iroha_sort bundle exec rspec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/iroha_sort.
