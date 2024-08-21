# RenderKit

RenderKit is a small library to that extends rails [renderable classes](https://github.com/rails/rails/pull/36388) functionality by:
  - Allowing renderables to be called by a string identifier, i.e. `render "my_renderable"
  - Allowing renderables to be used in place of views with matching controller actions

This project is best used alongside a component library like [ViewComponent](https://viewcomponent.org/) or [Phlex](https://github.com/phlex-ruby/phlex-rails)


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'render_kit'
```

And then execute:

    $ bundle install


## Usage
### Rendering like partials
#### Defining a renderable
To begin you first need a (Rails renderable class)[https://github.com/rails/rails/pull/36388]

```ruby
class MyRenderable
  def render_in(_)
    "Hello World"
  end
end
```

#### Registering a renderable
You can register a renderable by calling `ActionView::Base.register_renderable` with a string identifier and the renderable class

```ruby
class MyRenderable
  ActionView::Base.register_renderable("my_renderable", self)

  def render_in(_)
    "Hello World"
  end
end
```

```erb
<%= render "my_renderable" %> # => "Hello World"
```
### Using renderables in place of views
#### Defining a controller action
```ruby
class MyController < ApplicationController
  def index
    render MyRenderable.new
  end
end
```

#### Defining a renderable
```ruby
class MyRenderable
  ActionView::Base.register_renderable("my_controller_index", self)

  def render_in(_)
    "Hello World"
  end
end

```
This will render the renderable in place of the view for the `index` action in `MyController`

## Development

After checking out the repo, run `bin/setup` to install dependencies.The tests use [Appraisal](https://github.com/thoughtbot/appraisal) to run multiple rails versions(7.0, 7.1, 7.2), i.e for rails 7.2 run `bundle exec appraisal rails-7.1 rake test`

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/reeganviljoen/render_kit). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/reeganviljoen/render_kit/blob/main/CODE_OF_CONDUCT.md).

## Code of Conduct

Everyone interacting in the RenderKit project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/render_kit/blob/main/CODE_OF_CONDUCT.md) to ensure fait treatment of everyone, remember [MINASWAN](https://en.wiktionary.org/wiki/MINASWAN).
