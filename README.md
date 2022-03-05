# literal_enums-rails

Provides additional support for Rails with LiteralEnums.

## Usage
Please see `literal_enums` for further documentaiton.

### ActiveJob

Literal Enums are automatically serialised and deserialised for ActiveJob. You don't need to do anythign special to enable this. Just treat enums are normal arguments.

### ActiveModel

You can add Enum attributes to any `ActiveModel` class as an `attribute`.

```ruby
class Article < ApplicationRecord
  class State < Enum
    Published()
    Unpublished()
  end

  attribute :state, Enum[State]
end
```

Note: you need to specify exactly which Enum class the attribute is expected to be. This is so it can deserialise and cast a value to the correct member.

If you're storing the values in a database, make sure the tyep of the value matches the type of the database field. If the members don't specify values, their names will be used instead.

These are not the same as Rails enums as they don't add mysterious scopes and predicates to the model itself.

Instead of asking the Article if it is published, you'd need to inspect the Article's state attribute directly.

You can do this with a comparator e.g. `==` or with a polymorphic predicate.

```ruby
# The Rails way
Article.published?

# The Literal Enums way
Article.state.published?
```

Scoping the predicate to the state attribute itself reduces the risk of collision. It also means the enum makes no assumptions about the business logic of your model. It may not be the case that whole article is published because the state is published.

You can use Enums like any other value when writing database queries in ActiveRecord. For example, you might define a scope like this:

```ruby
scope :published -> { where(state: State::Published, publish_at: ..Time.current) }
```

You can also define associations from an enum to relevant records.

```ruby
class Article < ApplicationRecord
  class State < Enum
    Published()
    Unpublished()

    has_many :articles
  end

  attribute :state, Enum[State]
end

Article::State::Published.articles # returns a relation to articles with the Published state.
```

`has_many` optionally accepts a `class_name` for the model to query, as well as the name of the enum attribute.

```ruby
has_many :publication_events, class_name: "ArticlePublicationEvent", as: :publication_status

# Translates to this
def self.publication_events
  ArticlePublicationEvent.where(publication_status: self)
end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem "literal_enums-rails"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install literal_enums-rails
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
