module TasksHelper
  def css_for(task)        
    if task.status == "todo" 
      'important'
    elsif task.status == "ongoing" 
      'warning'   
    elsif task.status == "test"
      'success'
    else
      'info'        
    end  
  end  
end

