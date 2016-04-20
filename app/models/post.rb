class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :body, presence: true

  validates :title, length: { minimum: 6 }
  validates :body, length: { minimum: 20 }

  has_many :comments
end
