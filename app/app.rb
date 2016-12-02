ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, "himitsu"

  helpers do
    def current_user
      @current_user ||= User.first(email: session[:email])
    end
  end

  get '/' do
    erb :index
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  post '/links' do
    link = Link.create(title: params[:title], url: params[:url])
    if params[:tag].include? ","
      tags = params[:tag].split(",")
      tags.each do |tag|
        link.tags << Tag.create(content: tag)
      end
    else
      tag= Tag.create(content: params[:tag])
      link.tags << tag
    end

    link.save
    redirect to('/links')
  end

  get '/links/new' do
    erb :new_link
  end

  post '/tags' do
    session[:filter] = params[:filter]
    redirect to("/tags/#{params[:filter]}")
  end

  get '/tags/*' do
    @linktags = LinkTag.all
    @filter = session[:filter]
    erb :filter
  end

  get '/users/new' do
    erb :signup
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password])
    session[:email] = params[:email]
    redirect to('/links')
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
