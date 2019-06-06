class Song < ActiveRecord::Base 
    belongs_to :artist
    has_many :song_genres 
    has_many :genres, through: :song_genres

    def slug
        slug_name = self.name
        slug_name.downcase.gsub(" " , "-")
    end

    def self.find_by_slug(slug)
        reverse_slug = slug.split("-").map {|word| word.capitalize}.join(" ")
        Song.all.where("name = ?", reverse_slug).first
    end
end
