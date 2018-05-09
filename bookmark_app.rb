require 'sinatra/base'
require './lib/bookmark'

class Bookmark_manager < Sinatra::Base

  get '/' do
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
    Bookmark.add(params[:new_bookmark])
    redirect('/')
  end

  run! if app_file == $0
end
