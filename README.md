# Ruby ORM

## About

Ruby ORM is a framework connecting classes to relational database tables.  By using a preconfigured base class along with metaprogramming techniques, RubyORM allows the user to set up important functionality by creating Models, the M in MVC.  Besides having their own functionality of making common queries, models can also be connected to other models via associations.  

## Architecture and Technologies

The project is implemented with the following technologies:

- `Ruby`

## Technical Implementation

Some technical highlights of the app are:
1. Feature 1

### Feature 1

An instance of Object-Oriented Programming - all pieces inherit from a `Piece` class.  The `Bishop`, `Rook` and `Queen` inherit from the `SlidingPiece` module for multi-tile movement, while the `Knight` and `King` inherit from the `SteppingPiece` module.  

```ruby
  // from board.rb

  def dup

    dup_board = Board.new(false)

    pieces.each do |piece|
      piece.class.new(piece.color, dup_board, piece.pos)
    end

    dup_board

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
