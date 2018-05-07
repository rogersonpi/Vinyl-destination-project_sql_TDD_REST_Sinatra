require_relative ( "../db/sql_runner.rb" )

class Artist

  attr_reader( :id, :name)

  def initialize (options)
    @id = options['id'].to_i if options['id']
    @name = options["name"]

  end

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

  def self.all()
    sql = "SELECT * FROM artists"
    results = SqlRunner (sql)
    return results.map {|result| Artist.new(result)}
  end
  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run( sql )
  end


end
