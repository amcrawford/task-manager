require_relative '../test_helper'
require 'tilt/erb'

class VisitIndexfromHomepageTest < FeatureTest
  def test_it_visits_index
    visit '/'
      click_link("index_button")
      assert_equal '/tasks', current_path
  end
end
