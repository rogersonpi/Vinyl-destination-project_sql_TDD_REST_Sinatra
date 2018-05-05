require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )

get '/albums/inventory' do
  @albums = Album.find_albums()
  erb(:"albums/index")
end
