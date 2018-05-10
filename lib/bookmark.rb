require 'pg'
require 'uri'

class Bookmark
  attr_reader :url, :title

  def initialize (url, title)
    @url = url
    @title = title
  end
  
  def self.all
    ENV['db'] = 'bookmark_manager' if (ENV['db'] == nil)
    con = PG.connect :dbname => ENV['db'], :user => ENV['user']
    con.exec "SELECT * FROM bookmarks"
  end

  def self.add(url, title)
    @url = url
    @title = title
    ENV['db'] = 'bookmark_manager' if (ENV['db'] == nil)
    con = PG.connect :dbname => ENV['db'], :user => ENV['user']
    rs = con.exec "INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')"
    self.valid? ? rs : flash[:error] = "Error! Wrong URL"
  end

  def self.valid?
    @url =~ /\A#{URI::regexp}\z/
  end

end
