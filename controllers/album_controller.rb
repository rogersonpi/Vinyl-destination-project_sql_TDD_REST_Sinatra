require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )

get '/albums' do
  @albums = Album.all()
  erb(:"albums/index")
end

get '/albums/:id' do
  @artist = Album.find_artist(params[:id])
  erb(:"albums/show")
end
