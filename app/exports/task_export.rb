class TaskExport
	CSV_HEADERS = %w(Id Status Priority Hours Registered Sprint Project)
	attr_reader :task

	def initialize(task, options = {})
		@task = task
		@options = options
	end

	def to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << CSV_HEADERS
        @task.all.each do |task|
        csv << csv_attrs_for(task)
      end
    end
  end

  private

  def csv_attrs_for(task)
    [task.id, task.status, task.priority, task.hours, task.created_at.to_date, task.sprint.name, task.sprint.project.name]
  end
end