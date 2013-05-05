module DashboardHelper

	def qtd_by(sts, projects)
		@projects.map do |p|
      		project = Project.where("t.status = ? and projects.name = ?", [sts], [p.name]).select('count(t.id) as qtd').joins('join sprints s on s.project_id = projects.id join tasks t on t.sprint_id = s.id').group('t.status')  
      		data = project.detect{ |pr| pr.name = p}
      		data && data.qtd.to_i || 0      
    	end
	end	

end