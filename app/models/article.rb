class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  belongs_to :users,  optional: true
end
