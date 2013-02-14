require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  
	tests UserMailer

	test "new pledge" do 
		
		project = FactoryGirl.create :project
		pledge = FactoryGirl.create :pledge, project: project

		backer = pledge.user

		email = UserMailer.new_pledge(pledge).deliver

		assert_equal [project.user.email], email.to
		assert_equal "Your project received some backing on CrowdFunder.", email.subject
		assert_match pledge.amount.to_s, email.body.to_s

	end


end
