require_relative ( "../bd/SqlRunner" )

class Album

  attr_reader()

  def initialize (options)
    @name = options["name"]
    @genre = options["genre"]
    @album_id = options["album_id"].to_i


  end
end
