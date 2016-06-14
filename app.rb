require 'sinatra/base'
require './app/models/link'

class Bookmark < Sinatra::Base
  get '/' do
    @links = Link.all
    erb :'links/index'
  end

  get '/add_link' do
    erb :'links/add_link'
  end

  post '/' do
    Link.create(url: params[:url], name: params[:name])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
