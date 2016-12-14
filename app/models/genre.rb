class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
      songs.count
  end

  def artist_count
    artists.count
  end

  def all_artist_names
    #we know this returns the artists associated with one genre because it is an instance method (notice there is no self. to denote class method)
    artists.map do |artist|
      artist.name
    end
    #this is the moment
    #1st try was artists.name which returned Artist because .name is a class method that returns the name of the class(Artist).
    #2nd try was artists which returned #<ActiveRecord::Associations::CollectionProxy [#<Artist id: 1, name: "MJ">, #<Artist id: 2, name: "Adele">, #<Artist id: 3, name: "James Brown">]
    #artists in this case is an ARACP that behaves like an array. this is an array of artists belonging to 1 genre - in this case, the genre_id of 1 (which could be "named" Pop) - see above
  end
end


#question
#Here, when I called artists.name -> Artist (name of artists class). When i call artist.name, no method found.

#answer
#genre cannot respond to artist because artist is not a method defined for it in our associations. only artists reader and writer methods are defined (look as has many)
#artists is an ARACP object which is like an array. You can call .name on this array(bc active record specific methods) and active records is doing self.class.name, returning you the name of the class that generated this array.

#In song.rb, when I called genres.name, no method found. But when i call genre.name it returns "Rock".

#answer
#genres is not defined in the song model associations. so there are no reader/writer methods to assign a song genres. If we did, it would imply 1 song has many genres. but our schema says a song belongs to 1 genre
#thus belongs_to genre defines reader/writer methods for "genre" specifically
