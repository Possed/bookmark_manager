require 'bookmark'

describe Bookmark do
  describe'.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to be_an_instance_of(PG::Result)
    end
  end
end
