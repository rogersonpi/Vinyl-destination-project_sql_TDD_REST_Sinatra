require_relative ( "../db/sql_runner.rb" )

class Artist

  attr_reader( :id, :name, :album_id)

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options["name"]
    @album_id = options["album_id"].to_i
  end

  def save()

    sql = "INSERT INTO artists
    (name, album_id)
    values
    ($1, $2)
    RETURNING id"
    values = [@name, @album_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    results = SqlRunner (sql)
    return results.map {|result| Artist.new(result)}

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run( sql )
  end


end
