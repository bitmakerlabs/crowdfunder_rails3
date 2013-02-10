require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  
  test "browsing projects" do 
  	project1 = FactoryGirl.create(:project, :title => "Project 1")
  	project2 = FactoryGirl.create(:project, :title => "Project 2")
  	project3 = FactoryGirl.create(:project, :title => "Project 3")

  	visit "/projects"
  	assert_equal projects_path, current_path

  	# Expect the heading
  	assert page.has_content?('Listing projects')

  	# Expect the 3 projects
  	assert page.has_content?('Project 1')
  	assert page.has_content?('Project 2')
  	assert page.has_content?('Project 3')

  	# Go to the project details (show) page
  	click_link 'Project 1'
  	assert_equal project_path(project1), current_path
  	assert find('h1:first').has_content? project1.title



	end

	test "navigation" do
		visit "/"
		assert_equal root_path, current_path
		# The home nav element should be active
		assert_equal "Home", find('.navbar ul li.active a').text

		find('.navbar ul').click_link('Projects') # more specific: 
		assert_equal projects_path, current_path

		# The projects nav element should be active
		assert_equal "Projects", find('.navbar ul li.active a').text
	end



end
