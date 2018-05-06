require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/album_controller')

get '/' do
  erb( :index )
end
