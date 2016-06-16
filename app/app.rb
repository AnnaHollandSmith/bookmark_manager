ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Bookmark < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

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

  get '/users/new' do
  @user = User.new
  erb :'users/new'
end

  post '/users' do
  @user = User.new(email: params[:email],
                  password: params[:password],
                  password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/new'
    end
  end




  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
  end

  run! if app_file == $0
end
