class Pledge < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  attr_accessible :amount

  validates :user, presence: true
  validates :project, presence: true
  validates :amount, numericality: {greater_than: 0}


end
