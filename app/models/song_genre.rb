class SongGenre < ActiveRecord::Base

  belongs_to :song
  belongs_to :genre

  def slug
    self.name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug_name)
    @slug_name = slug_name
    self.all.find {|model| model.slug== @slug_name}
  end

end
