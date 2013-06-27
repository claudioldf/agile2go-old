module TasksHelper

  def status(task)
	if task.status == 'TODO' 
	  html = <<-HTML
	  	<td><span class="label label-important">#{task.status}</span></td>
	  	HTML
		html.html_safe    
    elsif task.status == 'ONGOING'
    	html = <<-HTML
    	  <td><span class="label label-warning">#{task.status}</span></td>
    	HTML
    	html.html_safe    
    elsif task.status == 'TEST'
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

