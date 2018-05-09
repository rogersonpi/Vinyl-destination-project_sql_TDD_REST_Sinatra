require_relative ( "../db/sql_runner.rb" )

class Artist

  attr_reader(:id)
  attr_accessor( :name )

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options["name"]
  end

  #instance

  def save()

    sql = "INSERT INTO artists
    (name)
    values
    ($1)
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
  sql = "UPDATE artists
  SET

      name = $1

    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run( sql, values )
  end

  def get_albums
    sql = "SELECT * FROM albums WHERE albums.artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map {|result| Album.new(result)}

  end
  #class
  def self.find(id)
    sql = "SElECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Artist.new(result)
  end

  def self.delete_artist(id)
    sql = "DELETE FROM artists WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM artists"
    results = SqlRunner.run(sql)
    return results.map {|result| Artist.new(result)}
  end
  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run( sql )
  end

end
