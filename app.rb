ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
#require './app/models/link'
require_relative './app/data_mapper_setup'

class Bookmark < Sinatra::Base
  get '/' do
    @links = Link.all
    erb :'links/index'
  end

  get '/add_link' do
    erb :'links/add_link'
  end

  post '/' do
    link = Link.new(url: params[:url],     # 1. Create a link
                name: params[:name])
  tag  = Tag.first_or_create(name: params[:tags])  # 2. Create a tag for the link
  link.tags << tag                       # 3. Adding the tag to the link's DataMapper collection.
  link.save                              # 4. Saving the link.
  redirect to('/')
end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
