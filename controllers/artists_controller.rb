require( 'sinatra' )
require( 'sinatra/contrib/all' )
#require("pry")
require_relative( '../models/album.rb' )
require_relative('../models/artist.rb')

get '/artists' do #index
  @artist = Artist.all()
  erb(:"artists/index")
end

get '/artists/:id' do #show
  @artist = Artist.find_artist(params[:id])
  erb(:"artists/show")
end

get '/artists/new' do #new
  @artists = Artist.all()
  erb( :"artists/new" )
end
#
# post '/artists' do #create
#  @newalbum = Album.new(params)
#  @newalbum.save()
#  redirect to ("/albums")
# end
#
# get '/artists/:id/edit' do
#   # edit
#   @artists = Artist.all()
#   @album = Album.find_album( params[:id] )
#   erb( :"albums/edit" )
# end
#
# get '/artist/:id' do #show
#   @album = Album.find_album(params[:id])
#   erb(:"albums/show")
# end
#
# post '/artist/:id/edit' do
#   Album.new(params).update
#   redirect to ("/albums")
# end
#
# post '/artists/:id/delete' do
#   Artist.delete_album(params[:id])
#   redirect to ("/albums")
# end
#
#
