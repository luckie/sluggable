class Book < ActiveRecord::Base
  belongs_to :author
  sluggify :title, scope: :author_id
end
