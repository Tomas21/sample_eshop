class Post < ActiveRecord::Base

  has_many :comments
  belongs_to :category
  scope :published, -> { where(published: true) }

  validates :title, :body, presence: true

end
