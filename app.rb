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
    link = Link.create(url: params[:url], name: params[:name])
    params[:tags].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect to('/')
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
