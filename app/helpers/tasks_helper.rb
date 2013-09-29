module TasksHelper

  def progress(task)
    if task.status == "todo"
      'bar-danger'
    elsif task.status == "done"
      'bar-success'
    elsif task.status == "test"
      'bar-warning bar-task-color'
    end
  end

  def background_color(status)
    if status == "todo"
      '#c32f34'
    elsif status == "ongoing"
      '#4bb1cf'
    elsif status == "test"
      '#80699B'
    else
      '#5eb95e'
    end
  end
end

