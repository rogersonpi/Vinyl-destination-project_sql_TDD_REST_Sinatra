require_relative( "../models/album.rb" )
require_relative( "../models/artist.rb" )

require("pry-byebug")

#Album.delete_all()
#Artist.delete_all()

album1 = Album.new ({
  "title" => "Sleeping through the war",
  "genre" => "neo-psychedelia",
  "quantity" => "10",
  "price" => "1100",
  "cost" => "300"})
album1.save()
album2 = Album.new ({
  "title" => "Lost In The Dream",
  "genre" => "psychedelic folk rock",
  "quantity" => "10",
  "price" => "1100",
  "cost" => "300"})
album2.save()
album3 = Album.new ({
  "title" => "Big Fish Theory",
  "genre" => "Experimental Hip Hop",
  "quantity" => "10",
  "price" => "1100",
  "cost" => "300"})
album3.save()
album4 = Album.new ({
  "title" => "We got it from Here...Thank You 4 Your service",
  "genre" => "Hip Hop",
  "quantity" => "10",
  "price" => "1100",
  "cost" => "300"})
album4.save()
album5 = Album.new ({
  "title" => "Sleep Well Beast",
  "genre" => "Indie Rock",
  "quantity" => "10",
  "price" => "1100",
  "cost" => "300"})
album5.save()

artist1 = Artist.new ({
  "name" => "All them Witches",
  "album_id" => album1.id
  })
artist1.save()
artist2 = Artist.new ({
  "name" => "The War on Drugs",
  "album_id" => album2.id
  })
artist2.save()
artist3 = Artist.new ({
  "name" => "Vince Staples",
  "album_id" => album3.id
  })
artist3.save()
artist4 = Artist.new ({
  "name" => "A Tribe Called Quest",
  "album_id" => album4.id
  })
artist4.save()
artist5 = Artist.new ({
  "name" => "The National",
  "album_id" => album5.id
  })
artist5.save()


binding.pry
nil
