require_relative '../test_helper'
require 'tilt/erb'

class IndexRenderTest < FeatureTest
  def setup
    3.times do |num|
      TaskManager.create({:title => "My Task #{num + 1}",
                          :description => "#{num + 1}"})
    end
  end

  def test_user_sees_header
    visit '/tasks'
    within("#greeting") do
      assert page.has_content?("Your Tasks for this Week")
    end
  end

  def test_it_shows_tasks
    visit '/tasks'
    within("#task_list") do
      assert page.has_content?("My Task 1")
    end
  end

  def test_it_contains_links_to_tasks
    skip
  end
end
