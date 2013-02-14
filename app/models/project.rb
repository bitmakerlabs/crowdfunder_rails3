class Project < ActiveRecord::Base

  attr_accessible :description, :goal, :teaser, :title

  belongs_to :user
  has_many :pledges
  has_many :images, dependent: :destroy

  validates :title, presence: true, length: {maximum: 100}
  validates :teaser, presence: true, length: {maximum: 255}
  validates :description, presence: true
  validates :goal, presence: true, numericality: {greater_than: 0, allow_blank: true}

end
