class User < ActiveRecord::Base
  authenticates_with_sorcery!
  attr_accessible :first_name, :last_name, :email, :password

  has_many :projects

	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :email, :presence => true
	validates :password, :presence => true, :on => :create


end
