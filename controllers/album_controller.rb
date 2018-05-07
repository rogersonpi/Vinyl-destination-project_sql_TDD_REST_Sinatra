require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )

get '/albums' do
  @albums = Album.all()
  erb(:"albums/index")
end

get '/albums/:id' do
  @album = Album.find_album(params[:id])
  erb(:"albums/show")
end

post '/albums/:id/delete' do
  Album.delete_album(params[:id])
  redirect to ("/albums")
end
