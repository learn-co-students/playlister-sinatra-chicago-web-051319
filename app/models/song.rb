class Song < ActiveRecord::Base 
    require_relative 'concerns/slugifiable.rb'
    include Slugifiable::Slug
    extend  Slugifiable::FindBySlug
    belongs_to :artist
    has_many :song_genres 
    has_many :genres, through: :song_genres

end
