# RayquazaORM

## About

<!-- RayquazaORM is a framework connecting classes to relational database tables.  By using a preconfigured base class along with metaprogramming techniques, RayquazaORM allows the user to set up important functionality by creating Models, the M in MVC.  Besides having their own functionality of making common queries, models can also be connected to other models via associations.   -->

## Architecture and Technologies

The project is implemented with the following technologies:

- `Ruby`
- `RSpec TDD`
- `sqlite3`
- `ActiveSupport`

## Technical Implementation

Some technical highlights of the app are:
1. Metaprogramming methods `define_method`, `instance_variable_get` and `instance_variable_set`
2. RSpec guides
3. Option to print all queries and interpolation arguments that get sent to the SQL engine.  
```
$ PRINT_QUERIES=true rspec spec/0000_attr_accessor_object_spec.rb
```
4. SQLObject
5. ActiveSupport:
ActiveSupport (part of Rails) has an inflector library that adds methods to String to help you do this. In particular, look at the String#tableize method. You can require the inflector with require 'active_support/inflector'.

NB: you cannot always infer the name of the table. For example: the inflector library will, by default, pluralize human into humen, not humans. WAT. That's what your ::table_name= is for: so users of SQLObject can override the default, inferred table name.

### Feature 1

Implemented attr_accessor getter and setter methods using `define_method`, `instance_variable_get` and `instance_variable_set`

```ruby
  // from 00_attr_accessor_object.rb

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
