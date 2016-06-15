require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class Bookmarks < Sinatra::Base

  get '/' do
    'HELLO YOU'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new_link'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    tag = Tag.first_or_create(name: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end

  run! if app_file == $0
end
