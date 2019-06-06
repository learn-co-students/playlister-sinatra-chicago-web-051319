class Artist < ActiveRecord::Base

  has_many :songs
  has_many :genres , through: :songs

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug_name)
    @slug_name = slug_name
    self.all.find {|model| model.slug== @slug_name}
  end
end
