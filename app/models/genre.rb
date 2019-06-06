require 'pry'

class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    self.name.downcase.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
          # binding.pry
    new_slug = slug.split("-").collect do |old_slug|
      old_slug.capitalize
    end

    a = new_slug.join(" ")

    Genre.all.select do |genre|
      genre.name == a
    end[0]

  end
end
