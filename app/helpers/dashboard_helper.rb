module DashboardHelper

	def qtd_status_by(sts, project)
		qtd = project.find_by_sql("select count(t.id) as qtd from projects p join sprints s on s.project_id = s.project_id join tasks t on t.sprint_id = s.id
where 1 = 1 and t.status = '#{sts}' group by p.name, s.id, t.status") || 0
	end

	def orders_chart_series(orders, start_time)
    orders_by_day = orders.where(:purchased_at => start_time.beginning_of_day..Time.zone.now.end_of_day).
                    group("date(purchased_at)").
                    select("purchased_at, sum(total_price) as total_price")
    (start_time.to_date..Date.today).map do |date|
      order = orders_by_day.detect { |order| order.purchased_at.to_date == date }
      order && order.total_price.to_f || 0
    end.inspect
  end

end