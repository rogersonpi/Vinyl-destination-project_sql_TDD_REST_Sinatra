require_relative ( "../db/sql_runner.rb" )

class Album

  attr_reader( :id, :title, :genre, :quantity, :price, :cost)

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @title = options["title"]
    @genre = options["genre"]
    @quantity = options["quantity"].to_i
    @price = options["price"].to_i
    @cost = options["cost"].to_i

  end

# Instance methods
  def save()

    sql = "INSERT INTO albums
    (title, genre, quantity, price, cost)
    values
    ($1, $2, $3, $4, $5)
    RETURNING id"
    values = [@title, @genre, @quantity, @price, @cost]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

# class methods

  def self.all()
    sql = "SELECT * FROM albums"
    results = SqlRunner.run (sql)
    return results.map { |result| Album.new( result ) }
  end
#   def self.all()
#   sql = "SELECT * FROM zombies"
#   results = SqlRunner.run( sql )
#   return results.map { |hash| Zombie.new( hash ) }
# end

  def self.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run( sql )
  end


end
