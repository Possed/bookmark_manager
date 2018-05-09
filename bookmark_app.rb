require 'sinatra/base'
require './lib/bookmark'
require 'uri'

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
    url = params[:new_bookmark]
    if url =~ /\A#{URI::regexp}\z/
      Bookmark.add(params[:new_bookmark])
    else
      redirect('/error')
    end
    redirect('/')
  end

  get '/error' do
    erb :error
  end

  run! if app_file == $0
end
