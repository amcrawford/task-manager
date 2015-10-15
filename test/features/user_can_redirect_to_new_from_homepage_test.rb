require_relative '../test_helper'
require 'tilt/erb'

class VisitNewFormfromHomepageTest < FeatureTest
  def test_it_visits_new_form
    visit '/'
      click_link("new_button")
      assert_equal '/tasks/new', current_path
  end
end
