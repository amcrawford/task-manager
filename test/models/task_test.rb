require_relative '../test_helper'

class TaskTest < Minitest::Test
    def test_attributes_are_assigned_correctly
      task = Task.new({ "id" => "1",
                        "title" => "My Task",
                        "description" => "stuff"})
      assert_equal "1", task.id
      assert_equal "My Task", task.title
      assert_equal "stuff", task.description
    end
end
