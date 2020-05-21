class Artist < ActiveRecord::Base
  def self.find_by_slug(slug)
    self.all.find {|object| object.slug == slug}
  end

  def slug
    name.gsub(" ", "-").downcase
  end

  has_many :songs
  has_many :genres, through: :songs
end
