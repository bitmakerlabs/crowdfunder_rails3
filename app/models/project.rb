class Project < ActiveRecord::Base

  attr_accessible :description, :goal, :teaser, :title

  belongs_to :user
  has_many :pledges
  
end
