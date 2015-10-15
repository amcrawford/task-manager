require_relative '../test_helper'
require 'tilt/erb'

class TestGreetingTest < FeatureTest
  def test_user_can_see_the_greeting
    visit '/'
    within("#greeting") do
      assert page.has_content?("Welcome to the Task Manager")
    end
  end

end
