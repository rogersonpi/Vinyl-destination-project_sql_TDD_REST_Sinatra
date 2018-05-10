require( 'sinatra' )
require( 'sinatra/contrib/all' )
#require("pry")
require_relative( '../models/album.rb' )
require_relative('../models/artist.rb')
require('pry-byebug')

get '/artists' do #index
  @artist = Artist.all()
  erb(:"artists/index")
end

get '/artists/new' do #new
  erb( :"artists/new" )
end

get '/artists/:id' do
  #binding.pry
  @artist = Artist.find(params[:id])
  @albums = @artist.get_albums()
  erb(:"artists/show")
end

post '/artists' do #create
 @newalbum = Artist.new(params)
 @newalbum.save()
 redirect to ("/albums/new")
end

get '/artists/:id/edit' do
  # edit
  @artists = Artist.all()
  @artist = Artist.find(params[:id])
  erb( :"artists/edit" )
end
#


post '/artist/:id/edit' do
  Artist.new(params).update
  redirect to ("/artists")
end
#
post '/artists/:id/delete' do
  Artist.delete_artist(params[:id])
  redirect to ("/artists")
end


#
#
