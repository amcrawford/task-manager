require_relative '../test_helper'
require 'tilt/erb'

class EditTaskTest < FeatureTest
  def test_user_can_edit_a_task
    TaskManager.create(title: "New Task", description: "Stuff")

    visit '/tasks/1'
    click_link "Edit"
    assert_equal "/task/1/edit", current_path

    fill_in("task[title]", with: "Edited Task")
    fill_in("task[description]", with: "Edited Stuff")
    click_button "Submit"

    assert page.has_content? "Edited Task"
  end
end
