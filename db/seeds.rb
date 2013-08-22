# Task.all.each do |t|
#   if t.status == 'TODO'
#     t.status = 'todo'
#     t.save!
#   elsif t.status == 'ONGOING'
#     t.status = 'ongoing'
#     t.save!
#   elsif t.status == 'TEST'
#     t.status = 'test'
#     t.save!
#   elsif t.status == 'DONE'
#     t.status = 'done'
#     t.save!
#   end
# end

# Project.destroy_all
# Sprint.destroy_all
# Task.destroy_all

#  YAML.load(ENV['ROLES']).each do |role|
#   Role.find_or_create_by_name({ :name => role }, :without_protection => true)
#    puts 'role: ' << role
#  end
# puts 'DEFAULT USERS'
# user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
# puts 'user: ' << user.name
# user.add_role :master

# p1 = Project.new
# p1.name = 'Agile2Go'
# p1.description = 'Welcome to Agile2Go! This is will be your best tool to develop complex projects'
# p1.company = 'Criativa'
# p1.save

# p2 = Project.new
# p2.name = 'Gitcsm-Next'
# p2.description = 'This is the web application for the git-scm.com site. It is meant to be the first place that a person new to Git will land and download or learn about the Git SCM system. This app is written in Ruby on Rails and deployed on Heroku.'
# p2.company = 'GitHub'
# p2.save

# p3 = Project.new
# p3.name = 'Diaspora'
# p3.description = 'Diaspora is a privacy-aware, personally-controlled, do-it-all open source social network'
# p3.company = 'Developer Community'
# p3.save

# p4 = Project.new
# p4.name = 'Paperclip'
# p4.description = 'Paperclip is intended as an easy file attachment library for Active Record. The intent behind it was to keep setup as easy as possible and to treat files as much like other attributes as possible. This means they arent saved to their final locations on disk, nor are they deleted if set to nil, until ActiveRecord::Base#save is called'
# p4.company = 'Thoughtbot'
# p4.save

# p5 = Project.new
# p5.name = 'Clearance'
# p5.description = 'Rails authentication with email & password. Clearance was extracted out of Airbrake. It is intended to be small, simple, well-tested, with easy to override defaults.'
# p5.company = 'Thoughtbot'
# p5.save

# p6 = Project.new
# p6.name = 'Trial Map'
# p6.description = 'Trail Map to help designers and developers learn various topics.'
# p6.company = 'Thoughtbot'
# p6.save


# s1 = Sprint.new
# s1.name = 'a2g-sprint1'
# s1.daily_scrum = '10:00'
# s1.start_date = '2013/06/01'
# s1.end_date = '2013/06/10'
# s1.goal = 'Delivery as values as possible to colect feed back very soon'
# s1.project_id = p1.id
# s1.save

# s2 = Sprint.new
# s2.name = 'gn-sprint1'
# s2.daily_scrum = '10:00'
# s2.start_date = '2013/06/20'
# s2.end_date = '2013/07/01'
# s2.goal = 'Delivery as values as possible to colect feed back very soon'
# s2.project_id = p2.id
# s2.save

# s3 = Sprint.new
# s3.name = 'dsp-sprint1'
# s3.daily_scrum = '10:00'
# s3.start_date = '2013/07/10'
# s3.end_date = '2013/07/20'
# s3.goal = 'Delivery as values as possible to colect feed back very soon'
# s3.project_id = p3.id
# s3.save

# s4 = Sprint.new
# s4.name = 'ppc-sprint1'
# s4.daily_scrum = '10:00'
# s4.start_date = '2013/07/10'
# s4.end_date = '2013/07/20'
# s4.goal = 'Delivery as values as possible to colect feed back very soon'
# s4.project_id = p4.id
# s4.save

# s5 = Sprint.new
# s5.name = 'clr-sprint1'
# s5.daily_scrum = '10:00'
# s5.start_date = '2013/07/10'
# s5.end_date = '2013/07/20'
# s5.goal = 'Delivery as values as possible to colect feed back very soon'
# s5.project_id = p5.id
# s5.save

# s6 = Sprint.new
# s6.name = 'tmp-sprint1'
# s6.daily_scrum = '10:00'
# s6.start_date = '2013/07/10'
# s6.end_date = '2013/07/20'
# s6.goal = 'Delivery as values as possible to colect feed back very soon'
# s6.project_id = p6.id
# s6.save


# 33.times do
# 	t = Task.new
# 	t.hours = '8'
# 	t.priority = 3
# 	t.status = 'todo'
# 	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
# 	t.sprint_id = s1.id
# 	t.save
# end

# 46.times do
# 	t = Task.new
# 	t.hours = '5'
# 	t.priority = 3
# 	t.status = 'ongoing'
# 	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
# 	t.sprint_id = s1.id
# 	t.save
# end

# 13.times do
# 	t = Task.new
# 	t.hours = '5'
# 	t.priority = 3
# 	t.status = 'test'
# 	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
# 	t.sprint_id = s1.id
# 	t.save
# end

# 5.times do
# 	t = Task.new
# 	t.hours = '15'
# 	t.priority = 3
# 	t.status = 'done'
# 	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
# 	t.sprint_id = s1.id
# 	t.save
# end

# 47.times do
# 	t = Task.new
# 	t.hours = '6'
# 	t.priority = 2
# 	t.status = 'todo'
# 	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
# 	t.sprint_id = s2.id
# 	t.save
# end

# 16.times do
# 	t = Task.new
# 	t.hours = '5'
# 	t.priority = 3
# 	t.status = 'ongoing'
# 	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
# 	t.sprint_id = s2.id
# 	t.save
# end

# 6.times do
# 	t = Task.new
# 	t.hours = '8'
# 	t.priority = 3
# 	t.status = 'test'
# 	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
# 	t.sprint_id = s2.id
# 	t.save
# end

# 2.times do
# 	t = Task.new
# 	t.hours = '8'
# 	t.priority = 3
# 	t.status = 'done'
# 	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
# 	t.sprint_id = s2.id
# 	t.save
# end


# 89.times do
# 	t = Task.new
# 	t.hours = '6'
# 	t.priority = 1
# 	t.status = 'todo'
# 	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
# 	t.sprint_id = s3.id
# 	t.save
# end

# 4.times do
# 	t = Task.new
# 	t.hours = '5'
# 	t.priority = 3
# 	t.status = 'ongoing'
# 	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
# 	t.sprint_id = s3.id
# 	t.save
# end

# 12.times do
# 	t = Task.new
# 	t.hours = '8'
# 	t.priority = 3
# 	t.status = 'test'
# 	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
# 	t.sprint_id = s3.id
# 	t.save
# end

# 3.times do
# 	t = Task.new
# 	t.hours = '8'
# 	t.priority = 1
# 	t.status = 'done'
# 	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
# 	t.sprint_id = s3.id
# 	t.save
# end

# 20.times do
#   t = Task.new
#   t.hours = '6'
#   t.priority = 1
#   t.status = 'todo'
#   t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
#   t.sprint_id = s4.id
#   t.save
# end

# 45.times do
#   t = Task.new
#   t.hours = '5'
#   t.priority = 3
#   t.status = 'ongoing'
#   t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
#   t.sprint_id = s4.id
#   t.save
# end

# 12.times do
#   t = Task.new
#   t.hours = '8'
#   t.priority = 3
#   t.status = 'test'
#   t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
#   t.sprint_id = s4.id
#   t.save
# end

# 30.times do
#   t = Task.new
#   t.hours = '8'
#   t.priority = 1
#   t.status = 'done'
#   t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
#   t.sprint_id = s4.id
#   t.save
# end

# 58.times do
#   t = Task.new
#   t.hours = '6'
#   t.priority = 1
#   t.status = 'todo'
#   t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
#   t.sprint_id = s5.id
#   t.save
# end
# 21.times do
#   t = Task.new
#   t.hours = '5'
#   t.priority = 3
#   t.status = 'ongoing'
#   t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
#   t.sprint_id = s5.id
#   t.save
# end

# 54.times do
#   t = Task.new
#   t.hours = '8'
#   t.priority = 3
#   t.status = 'test'
#   t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
#   t.sprint_id = s5.id
#   t.save
# end

# 70.times do
#   t = Task.new
#   t.hours = '8'
#   t.priority = 1
#   t.status = 'done'
#   t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
#   t.sprint_id = s5.id
#   t.save
# end


# 29.times do
#   t = Task.new
#   t.hours = '6'
#   t.priority = 1
#   t.status = 'todo'
#   t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
#   t.sprint_id = s6.id
#   t.save
# end

# 10.times do
#   t = Task.new
#   t.hours = '5'
#   t.priority = 3
#   t.status = 'ongoing'
#   t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
#   t.sprint_id = s6.id
#   t.save
# end

# 23.times do
#   t = Task.new
#   t.hours = '21'
#   t.priority = 3
#   t.status = 'test'
#   t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
#   t.sprint_id = s6.id
#   t.save
# end

# 230.times do
#   t = Task.new
#   t.hours = '8'
#   t.priority = 1
#   t.status = 'done'
#   t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
#   t.sprint_id = s6.id
#   t.save
# end

Project.all.each do |u|
  u.save!
end

Sprint.all.each do |u|
  u.save!
end

# Task.all.each do |u|
#   u.save!
# end

