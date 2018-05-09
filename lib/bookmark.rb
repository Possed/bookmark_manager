require 'pg'

class Bookmark

  def self.all
    ENV['db'] = 'bookmark_manager' if (ENV['db'] == nil)
    con = PG.connect :dbname => ENV['db'], :user => ENV['user']
    con.exec "SELECT * FROM bookmarks"
  end

  def self.add(url)
    ENV['db'] = 'bookmark_manager' if (ENV['db'] == nil)
    con = PG.connect :dbname => ENV['db'], :user => ENV['user']
    rs = con.exec "INSERT INTO bookmarks (url) VALUES('#{url}')"
  end

end
