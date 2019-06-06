class Genre < ActiveRecord::Base 
    require_relative 'concerns/slugifiable.rb'
    include Slugifiable::Slug
    extend  Slugifiable::FindBySlug
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
    
    # def slug
    #     slug_name = self.name
    #     slug_name.downcase.gsub(" " , "-")
    # end

    # def self.find_by_slug(slug)
    #     reverse_slug = slug.split("-").map {|word| word.capitalize}.join(" ")
    #     Genre.all.where("name = ?", reverse_slug).first
    # end

end