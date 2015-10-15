require_relative '../test_helper'
require 'tilt/erb'

class CreateTaskTest < FeatureTest
  def test_user_can_create_new_task
    visit '/tasks/new'
      assert_equal "/tasks/new", current_path

      fill_in("task[title]", with: "New Title")
      fill_in("task[description]", with: "New Desc.")
      click_button "Submit"

      assert_equal "/tasks", current_path
      assert page.has_content? "New Title"
  end
end
