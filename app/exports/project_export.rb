class ProjectExport
	CSV_HEADERS = %w(Name Description Company Registered)
	attr_reader :project

	def initialize(project, options = {})
		@project = project
		@options = options
	end

	def to_csv	
		CSV.generate(@options) do |csv|
      csv << CSV_HEADERS
        @project.all.each do |project|                
        csv << attributes_for(project)                
      end
    end
	end

	private
	
  def attributes_for(project)
    [project.name, project.description, project.company, project.created_at.to_date]
  end
end