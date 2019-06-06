class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs
    require_relative 'concerns/slugifiable.rb'
    include Slugifiable::Slug
    extend  Slugifiable::FindBySlug
end