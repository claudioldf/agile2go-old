class SprintExport
	CSV_HEADERS = %w(Id name Start Date End Date Daily Project Registered)
	attr_reader :sprint

	def initialize(sprint, options = {})
		@sprint = sprint
		@options = options
	end

	def to_csv	
		CSV.generate(@options) do |csv|
      csv << CSV_HEADERS
        @sprint.all.each do |sprint|                
        csv << attributes_for(sprint)                
      end
    end
	end

	private
	
  def attributes_for(sprint)
    [sprint.id, sprint.name, sprint.start_date.to_date, sprint.end_date.to_date, sprint.daily_scrum, sprint.project.name, sprint.created_at.to_date]
  end
end