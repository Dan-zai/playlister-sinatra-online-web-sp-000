class Genre < ActiveRecord::Base
  def self.find_by_slug(slug)
    self.all.find {|object| object.slug == slug}
  end

  def slug
    name.gsub(" ", "-").downcase
  end
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
