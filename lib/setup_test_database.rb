

def truncate_table
  con = PG.connect :dbname => 'bookmark_manager_test', :user => 'rox'
  rs = con.exec "TRUNCATE TABLE bookmarks"
end

def add_bookmarks
  con = PG.connect :dbname => 'bookmark_manager_test', :user => 'rox'
  rs = con.exec "INSERT INTO bookmarks VALUES(1, 'http://makersacademy.com')"
  rs = con.exec "INSERT INTO bookmarks VALUES(2, 'http://google.com')"
end
