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
end

post '/pizza-orders' do # create
  @album = PizzaOrder.new( params )
  @album.save()
  erb( :create )
end

get '/albums/:id/edit' do # edit
  @album = Album.find_album( params[:id] )
  erb( :"albums/edit" )
end

get '/albums/:id' do #show
  @album = Album.find_album(params[:id])
  erb(:"albums/show")
end

post '/albums/' do
  Album.new(params).update
  redirect to ("/albums")
end

post '/albums/:id/delete' do
  Album.delete_album(params[:id])
  redirect to ("/albums")
end








#look at restful roots.
