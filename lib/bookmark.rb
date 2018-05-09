require 'pg'

class Bookmark
  def self.all
    if ENV['RACK_ENV']== 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => ENV['user']
      con.exec "SELECT * FROM bookmarks"
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => ENV['user']
      con.exec "SELECT * FROM bookmarks"
    end
  end

  def self.add(url)
    if ENV['RACK_ENV']== 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => ENV['user']
      rs = con.exec "INSERT INTO bookmarks (url) VALUES('#{url}')"
    else
      con = PG.connect :dbname => 'bookmark_manager', :user => ENV['user']
      rs = con.exec "INSERT INTO bookmarks (url) VALUES('#{url}')"
    end
  end

end
