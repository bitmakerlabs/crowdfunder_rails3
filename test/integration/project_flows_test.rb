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

	end

end
