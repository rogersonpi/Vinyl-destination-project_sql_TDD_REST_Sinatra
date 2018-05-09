require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )
require_relative('../models/artist.rb')

get '/albums' do #index
  @albums = Album.all()
  erb(:"albums/index")
end

get '/albums/new' do #new
  @artists = Artist.all()
  erb( :"albums/new" )
end

post '/albums' do #create
 @newalbum = Album.new(params)
 @newalbum.save()
 redirect to ("/albums")
end

get '/albums/:id/edit' do
  # edit
  @artists = Artist.all()
  @albums = Album.find_album( params[:id] )
  erb( :"albums/edit" )
end

get '/albums/:id' do #show
  @album = Album.find_album(params[:id])
  erb(:"albums/show")
end

post '/albums/:id/edit' do
  Album.new(params).update
  redirect to ("/albums")
end

post '/albums/:id/delete' do
  Album.delete_album(params[:id])
  redirect to ("/albums")
end

post '/albums/:id/buy' do

  album = Album.find_album(params[:id])
  album.buy_album
  redirect to ('/albums')
end

post '/albums/:id/sell' do

  album = Album.find_album(params[:id])
  album.sell_album
  redirect to ('/albums')
end









#look at restful roots.
