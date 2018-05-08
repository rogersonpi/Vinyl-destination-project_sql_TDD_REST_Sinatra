require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/album.rb' )

get '/albums' do #index
  @albums = Album.all()
  erb(:"albums/index")
end

get '/albums/new' do #new
  erb( :"albums/new" )
end

post '/albums' do #create
 @newalbum = Album.new(params)
 @newalbum.save()
 erb( :"albums/create")
end

get '/albums/:id/edit' do # edit
  @ablum = Album.find_album( params[:id] )
  erb( :"albums/edit" )
end

get '/albums/:id' do #show
  @album = Album.find_album(params[:id])
  erb(:"albums/show")
end

post '/albums/:id' do
  Album.new(params).update
  redirect to ("/albums")
end

post '/albums/:id/delete' do
  Album.delete_album(params[:id])
  redirect to ("/albums")
end








#look at restful roots.
