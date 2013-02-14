require 'test_helper'

class My::ImageFlowsTest < ActionDispatch::IntegrationTest
  
	setup do 
		@user = setup_signed_in_user
		@project = FactoryGirl.create :project, user: @user
	end

	test "successfully uploading an image for my project" do 
		visit edit_my_project_path(@project)

		assert page.has_link?('Manage Images')
		click_link 'Manage Images'

		# The project shouldn't have any thumbnails
		page.assert_no_selector '.image'

		path = File.join(Rails.root, 'app', 'assets', 'images', "rails.png") 
  	attach_file("image[file]", path)
  	click_button("Upload Image")

  	# The project shouldn't have one thumbnail
  	page.assert_selector '.image', count: 1
	end

	test "failing upload of an image for my project" do 
		visit my_project_images_path(@project)

		path = File.join(Rails.root, 'app', 'assets', 'javascripts', "application.js") 
		attach_file("image[file]", path)
		click_button("Upload Image")

		# Expect to see an error message
		assert page.has_content?('not allowed')

		# Should have 0 images on the page
		page.assert_no_selector '.image'
	end

end
