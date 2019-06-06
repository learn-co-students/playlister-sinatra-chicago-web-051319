class Song < ActiveRecord::Base
  
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug_name)
    @slug_name = slug_name
    self.all.find {|model| model.slug== @slug_name}
  end
end
