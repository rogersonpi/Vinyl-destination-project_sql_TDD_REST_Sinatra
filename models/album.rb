require_relative ( "../db/sql_runner.rb" )

class Album

  attr_reader(:id)
  attr_accessor(:title, :genre, :quantity, :price, :cost, :artist_id)

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @title = options["title"]
    @genre = options["genre"]
    @quantity = options["quantity"].to_i
    @price = options["price"].to_i
    @cost = options["cost"].to_i
    @artist_id = options["artist_id"].to_i

  end

# Instance methods
  def save()

    sql = "INSERT INTO albums
    (title, genre, quantity, price, cost, artist_id)
    values
    ($1, $2, $3, $4, $5, $6)
    RETURNING id"
    values = [@title, @genre, @quantity, @price, @cost, @artist_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  # def markup()
  #   markup = @price - @Cost
  #
  # end

   def update()
   sql = "UPDATE albums
   SET
     (
       title,
       genre,
       quantity,
       price,
       cost
     ) =
     (
     $1, $2, $3, $4, $5
     )
     WHERE id = $6"
     values = [ @title, @genre, @quantity, @price, @cost, @id]
     SqlRunner.run( sql, values )
    end

  def sell_album()
    sql = "UPDATE albums
    SET
      quantity = $1

      WHERE id = $2"
      @quantity += -1
      values =[@quantity, @id]
      SqlRunner.run(sql, values)
    end

    def buy_album()
      sql = "UPDATE albums
      SET
        quantity = $1

      WHERE id = $2"
      @quantity += 1
      values =[@quantity, @id]
      SqlRunner.run(sql, values)
    end
  
# class methods

  def self.find_album(id)
    sql = "SElECT * FROM albums WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Album.new(result)
  end

  def self.delete_album(id)
    sql = "DELETE FROM albums WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM albums"
    results = SqlRunner.run(sql)
    return results.map { |result| Album.new( result ) }
  end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run( sql )
  end


end
