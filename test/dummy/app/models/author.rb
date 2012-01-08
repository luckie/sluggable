class Author < ActiveRecord::Base
  has_many :books
  sluggify :name, as: :name_slug
end
