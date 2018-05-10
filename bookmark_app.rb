require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require 'uri'


class Bookmark_manager < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    flash[:error] = nil
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  get '/add' do
    erb :add_bookmark
  end

  post '/save' do
    url = params[:new_bookmark]
    title = params[:new_title]
    Bookmark.add(url, title)
    redirect('/add')
  end

  run! if app_file == $0
end
