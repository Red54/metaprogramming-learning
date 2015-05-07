require 'sqlite3'

Database = SQLite3::Database.new ':memory:'

class Entity
  attr_reader :table, :ident

  def initialize(table, ident)
    @table = table
    @ident = ident
    Database.execute "CREATE TABLE IF NOT EXISTS #{@table}(id INT PRIMARYKEY)"
    Database.execute "INSERT INTO #{@table}(id) VALUES(#{@ident})"
  end

  def set(col, val)
    Database.execute "ALTER TABLE #{@table} ADD #{col} TXT" if !Database.execute("PRAGMA table_info(#{@table})").flatten.include?col
    Database.execute "UPDATE #{@table} SET #{col}='#{val}' WHERE id=#{ident}"
  end

  def get(col)
    Database.execute("SELECT #{col} FROM #{@table} WHERE id=#{@ident}")[0][0]
  end
end

class Movie < Entity
  def initialize(ident)
    super("movies", ident)
  end

  def title
    get("title")
  end

  def title=(value)
    set("title", value)
  end

  def director
    get("director")
  end

  def director=(value)
    set("director", value)
  end
end

movie = Movie.new(1)
movie.title = "大话西游"
movie.director = "周星驰"
puts '<<'+movie.title+'>> '+movie.director
movie = Movie.new(2)
movie.title = "Doctor Strangelove"
movie.director = "Stanley Kubrick"
puts '<<'+movie.title+'>> '+movie.director
movie = Movie.new(1)
movie.title = "大话西游之大圣娶亲"
puts '<<'+movie.title+'>> '+movie.director
