require_relative '../test_helper'

class TestTaskManager < Minitest::Test
  def test_task_is_created
    TaskManager.create({:title => "My Task",
                        :description => "stuff"})
    task = TaskManager.find(1)
    assert_equal 1, task.id
    assert_equal "My Task", task.title
    assert_equal "stuff", task.description
  end

  def test_prints_all_tasks
    TaskManager.create({:title => "My Task",
                        :description => "stuff"})
    assert_equal 1, TaskManager.all.count
    TaskManager.create({:title => "My Task 2",
                        :description => "stuff"})
    assert_equal 2, TaskManager.all.count
  end

  def test_all_allows_access_to_data
    TaskManager.create({:title => "My Task",
                        :description => "stuff"})
    assert_equal "My Task", TaskManager.all[0].title
  end

  def test_it_finds_specific_task_by_id
    TaskManager.create({:title => "My Task",
                        :description => "stuff"})
    TaskManager.create({:title => "My Task 2",
                        :description => "stuff"})
    assert TaskManager.find(1)
    assert_equal "My Task 2", TaskManager.find(2).title
  end

  def test_it_can_update_title
    TaskManager.create({:title => "My Task",
                        :description => "stuff"})
    assert_equal "My Task", TaskManager.find(1).title
    TaskManager.update(1, {:title => "Your Task", :description => "stuff"})
    assert_equal "Your Task", TaskManager.find(1).title
  end

  def test_it_can_update_description
    TaskManager.create({:title => "My Task",
                        :description => "stuff"})
    assert_equal "stuff", TaskManager.find(1).description
    TaskManager.update(1, {:title => "My Task", :description => "more stuff"})
    assert_equal "more stuff", TaskManager.find(1).description
  end

  def test_it_can_delete_a_task
    TaskManager.create({:title => "My Task",
                        :description => "stuff"})
    assert_equal 1, TaskManager.all.count
    TaskManager.delete(1)
    assert_equal 0, TaskManager.all.count
  end

  def test_it_can_delete_all_tasks
    skip
    TaskManager.create({:title => "My Task",
                        :description => "stuff"})
    TaskManager.create({:title => "My Task 2",
                        :description => "stuff"})
    TaskManager.delete_all

    assert_equal 0, TaskManager.all.count
  end
end

# dont test database, rawtasks, rawtask
