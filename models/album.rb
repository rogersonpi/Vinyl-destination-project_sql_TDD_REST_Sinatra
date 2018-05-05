require_relative ( "../bd/SqlRunner" )

class Album

  attr_reader()

  def initialize (options)
    @title = options["title"]
    @genre = options["genre"]
    @quantity = options["quantity"].to_i
    @price = options["title"].to_i
    @cost = options["title"].to_i

  end
