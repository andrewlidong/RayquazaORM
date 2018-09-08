# Ruby ORM

## About

Ruby ORM is a framework connecting classes to relational database tables.  By using a preconfigured base class along with metaprogramming techniques, RubyORM allows the user to set up important functionality by creating Models, the M in MVC.  Besides having their own functionality of making common queries, models can also be connected to other models via associations.  

## Architecture and Technologies

The project is implemented with the following technologies:

- `Ruby`

## Technical Implementation

Some technical highlights of the app are:
1. Metaprogramming methods `define_method`, `instance_variable_get` and `instance_variable_set`

### Feature 1

Implemented attr_accessor getter and setter methods using `define_method`, `instance_variable_get` and `instance_variable_set`

```ruby
  // from attr_accessor_object.rb

  class AttrAccessorObject
    def self.my_attr_accessor(*names)
      names.each do |name|
        define_method(name) do
          instance_variable_get("@#{name}")
        end

        define_method("#{name}=") do |value|
          instance_variable_set("@#{name}", value)
        end
      end
    end
  end
```

### Cursor Controls

```ruby
  def read_char
    STDIN.echo = false
    STDIN.raw!

    input = STDIN.getc.chr
    if input == "\e"
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end

    STDIN.echo = true
    STDIN.cooked!

    input
  end
```

## Future Features
In the future, I plan to add the following features:

*
