require_relative ( "../bd/SqlRunner" )

class Album

  attr_reader()

  def initialize (options)
    @title = options["title"]
    @genre = options["genre"]
    @quantity = options["quantity"].to_i
    @price = options["price"].to_i
    @cost = options["cost"].to_i

  end
end

  def save()

    sql = "INSERT INTO albums (title, genre, quantity, price,)"
