require_relative( "../models/album.rb" )
#require_relative( "../models/artist.rb" )

require("pry-byebug")

Album.delete_all()

album1 = Album.new ({

  "title" => "Sleeping through the war",
  "genre" => "neo-psychedelia",
  "quantity" => "10",
  "price" => "1100",
  "cost" => "300"})
album1.save()

binding.pry
nil
