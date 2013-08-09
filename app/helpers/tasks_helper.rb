module TasksHelper

  def status(task)
	if task.status == 'todo' 
	  html = <<-HTML
	  	<td><span class="label label-important">#{task.status}</span></td>
	  	HTML
		html.html_safe    
    elsif task.status == 'ongoing'
    	html = <<-HTML
    	  <td><span class="label label-warning">#{task.status}</span></td>
    	HTML
    	html.html_safe    
    elsif task.status == 'test'
    	html = <<-HTML
    	  <td><span class="label label-success">#{task.status}</span></td>
    	HTML
    	html.html_safe    
    else
    	html = <<-HTML
    	  <td><span class="label label-info">#{task.status}</span></td>
    	HTML
    	html.html_safe    
  	end 
  end  
end

