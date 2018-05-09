require 'pg'

class Bookmark
  def self.all
    if ENV['RACK_ENV']== 'test'
      con = PG.connect :dbname => 'bookmark_manager_test', :user => 'rox'
      rs = con.exec "SELECT * FROM bookmarks"
    else
      begin
        con = PG.connect :dbname => 'bookmark_manager', :user => 'rox'
        rs = con.exec "SELECT * FROM bookmarks"
      end
    end
    rs
  end
end
