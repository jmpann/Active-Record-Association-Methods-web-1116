class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre

  def get_genre_name
    genre.name
  end

  def drake_made_this
    #@artist = Artist.new(name: "Drake")
    @artist = Artist.new(:name => "Drake")
    #these two are the same. 
  end
end
