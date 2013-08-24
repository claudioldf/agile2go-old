class StatusTask

  def initialize(task)
    @task = task
  end

  def todo
    @task.status == 'todo'
  end

  def ongoing
    @task.status == 'ongoing'
  end

  def test
    @task.status == 'test'
  end

  def done
    @task.status == 'done'
  end
end
