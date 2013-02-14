require 'test_helper'

class ProjectFlowsTest < ActionDispatch::IntegrationTest
  
  test "browsing projects" do 
  	project1 = FactoryGirl.create(:project, :title => "Project 1")
  	project2 = FactoryGirl.create(:project, :title => "Project 2")
  	project3 = FactoryGirl.create(:project, :title => "Project 3")

  	visit "/projects"
  	assert_equal projects_path, current_path

  	# Expect the heading
  	assert page.has_content?('Projects')

  	# Expect the 3 projects
  	assert page.has_content?('Project 1')
  	assert page.has_content?('Project 2')
  	assert page.has_content?('Project 3')

  	# Go to the project details (show) page
  	click_link 'Project 1'
  	assert_equal project_path(project1), current_path
  	assert find('h1:first').has_content? project1.title
	end

  test "pagination" do 
    user = FactoryGirl.create :user
    50.times { |i| FactoryGirl.create(:project, title: "Project #{i}", user: user) }

    visit "/projects"

    # Expect the most recently created projects on page 1 (8 PER PAGE)
    assert page.has_content?('Displaying projects 1 - 8 of 50 in total')
    assert page.has_content?('Project 49')
    assert page.has_no_content?('Project 41')
    page.assert_selector 'li.project', count: 8

    # Expect pagination link and click page 2
    page.find('.pagination').click_link '2'
    assert projects_path(page: 2), current_path

    # Expect page 2 to have the next 8 projects
    assert page.has_content?('Project 41')
    assert page.has_no_content?('Project 32')
  end

	test "navigation" do
		project1 = FactoryGirl.create(:project, :title => "Project 1")
		visit "/"
		assert_equal root_path, current_path
		# The home nav element should be active
		assert_equal "Home", find('.navbar ul li.active a').text

		find('.navbar ul').click_link('Projects')
		assert_equal projects_path, current_path

		# ONLY the projects nav element should be active
		assert_equal "Projects", find('.navbar ul li.active a').text
    page.assert_selector '.navbar ul li.active a', count: 1


    # On the details page, again the same nav element should still be active!
    click_link 'Project 1'
    assert_equal "Projects", find('.navbar ul li.active a').text
	end



end
