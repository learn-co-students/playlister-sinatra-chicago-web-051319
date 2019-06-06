class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(' ', '-')
  end

  def self.find_by_slug(slug)
          # binding.pry
    new_slug = slug.split("-").collect do |old_slug|
      old_slug.capitalize
    end

    a = new_slug.join(" ")

    Artist.all.select do |artist|
      artist.name == a
    end[0]

  end
end
