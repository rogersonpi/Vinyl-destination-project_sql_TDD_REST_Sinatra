require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )

get '/albums/inventory' do
  @albums = Album.all()
  erb(:"albums/index")
end
