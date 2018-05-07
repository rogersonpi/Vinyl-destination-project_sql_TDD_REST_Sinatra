require_relative( "../models/album.rb" )
require_relative( "../models/artist.rb" )

require("pry-byebug")

#Album.delete_all()
#Artist.delete_all()


artist1 = Artist.new ({
  "name" => "All them Witches"
  })
artist1.save()
artist2 = Artist.new ({
  "name" => "The War on Drugs"
  })
artist2.save()
artist3 = Artist.new ({
  "name" => "Vince Staples"
  })
artist3.save()
artist4 = Artist.new ({
  "name" => "A Tribe Called Quest"
  })
artist4.save()
artist5 = Artist.new ({
  "name" => "The National"
  })
artist5.save()


album1 = Album.new ({
  "title" => "Sleeping through the war",
  "genre" => "neo-psychedelia",
  "quantity" => "10",
  "price" => "1100",
  "cost" => "300",
  "artist_id" => artist1.id })
album1.save()
album2 = Album.new ({
  "title" => "Lost In The Dream",
  "genre" => "psychedelic folk rock",
  "quantity" => "10",
  "price" => "1100",
  "cost" => "300",
  "artist_id" => artist2.id })
album2.save()
album3 = Album.new ({
  "title" => "Big Fish Theory",
  "genre" => "Experimental Hip Hop",
  "quantity" => "10",
  "price" => "1100",
  "cost" => "300",
  "artist_id" => artist3.id })
album3.save()
album4 = Album.new ({
  "title" => "We got it from Here...Thank You 4 Your service",
  "genre" => "Hip Hop",
  "quantity" => "10",
  "price" => "1100",
  "cost" => "300",
  "artist_id" => artist4.id })
album4.save()
album5 = Album.new ({
  "title" => "Sleep Well Beast",
  "genre" => "Indie Rock",
  "quantity" => "10",
  "price" => "1100",
  "cost" => "300",
  "artist_id" => artist5.id})
album5.save()


binding.pry
nil
