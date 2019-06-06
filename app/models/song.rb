class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

  def slug
    self.name.downcase.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
          # binding.pry
    new_slug = slug.split("-").collect do |old_slug|
      old_slug.capitalize
    end

    a = new_slug.join(" ")

    Song.all.select do |song|
      song.name == a
    end[0]

  end
end
