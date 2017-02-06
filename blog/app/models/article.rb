class Article < ApplicationRecord
	belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :users, :through => :comments
  validates :title, presence: true,
            length: {minimum: 5}
end
