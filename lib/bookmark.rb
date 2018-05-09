require 'pg'

class Bookmark
  def self.all

    begin
      con = PG.connect :dbname => 'bookmark_manager', :user => 'rox'
      rs = con.exec "SELECT * FROM bookmarks"
    end
    rs
  end
end
