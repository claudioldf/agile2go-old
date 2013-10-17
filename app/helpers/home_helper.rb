module HomeHelper

  def qtd_by(status, projects)
    @projects.map do |p|
      project = Project.qty_tasks(status, p.name)
      data = project.detect { |pr| pr.name = p }
      data && data.qtd.to_i || 0
    end
  end
end
