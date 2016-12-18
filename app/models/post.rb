class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy

  validates :content, presence: true
end
