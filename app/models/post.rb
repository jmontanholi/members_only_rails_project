class Post < ApplicationRecord
  validates :title, :body, presence: true

  validates :title, length: { minimum: 6 }
  validates :body, length: { minimum: 10 }
end
