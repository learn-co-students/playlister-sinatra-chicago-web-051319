class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def slug
        slug_name = self.name
        slug_name.downcase.gsub(" " , "-")
    end

    def self.find_by_slug(slug)
        reverse_slug = slug.split("-").map {|word| word.capitalize}.join(" ")
        Artist.all.where("name = ?", reverse_slug).first
    end
end