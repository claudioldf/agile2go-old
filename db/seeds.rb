# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
 puts 'ROLES'
 YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
   puts 'role: ' << role
 end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :master

 #Project.destroy_all
 #Sprint.destroy_all
 #Task.destroy_all

p1 = Project.new
p1.name = 'Agile2Go'
p1.description = 'Welcome to Agile2Go! This is will be your best tool to develop complex projects'
p1.company = 'Criativa'
p1.save

p2 = Project.new
p2.name = 'FASCE'
p2.description = 'Integration between SAP and yous needs never was so easy. You can with FASCE!'
p2.company = 'Embraer'
p2.save

p3 = Project.new
p3.name = 'M-Payment'
p3.description = 'Very soon mobile payment solution'
p3.company = 'Criativa'
p3.save

s1 = Sprint.new
s1.name = 'Sprint1'
s1.daily_scrum = '10:00'
s1.start_date = '2013/06/01'
s1.end_date = '2013/06/10'
s1.goal = 'Delivery as values as possible to colect feed back very soon'
s1.project_id = p1.id
s1.save

s2 = Sprint.new
s2.name = 'Sprint2'
s2.daily_scrum = '10:00'
s2.start_date = '2013/06/20'
s2.end_date = '2013/07/01'
s2.goal = 'Delivery as values as possible to colect feed back very soon'
s2.project_id = p2.id
s2.save

s3 = Sprint.new
s3.name = 'Sprint3'
s3.daily_scrum = '10:00'
s3.start_date = '2013/07/10'
s3.end_date = '2013/07/20'
s3.goal = 'Delivery as values as possible to colect feed back very soon'
s3.project_id = p3.id
s3.save

#Task.destroy_all

33.times do 
	t = Task.new
	t.hours = '6'
	t.priority = 3 
	t.status = 'TODO'
	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
	t.sprint_id = s1.id
	t.save
end

46.times do 
	t = Task.new
	t.hours = '5'
	t.priority = 3 
	t.status = 'ONGOING'
	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
	t.sprint_id = s1.id
	t.save
end

13.times do 
	t = Task.new
	t.hours = '8'
	t.priority = 3 
	t.status = 'TEST'
	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
	t.sprint_id = s1.id
	t.save
end

5.times do 
	t = Task.new
	t.hours = '8'
	t.priority = 3 
	t.status = 'DONE'
	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
	t.sprint_id = s1.id
	t.save
end

47.times do 
	t = Task.new
	t.hours = '6'
	t.priority = 2 
	t.status = 'TODO'
	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
	t.sprint_id = s2.id
	t.save
end

16.times do 
	t = Task.new
	t.hours = '5'
	t.priority = 3 
	t.status = 'ONGOING'
	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
	t.sprint_id = s2.id
	t.save
end

6.times do 
	t = Task.new
	t.hours = '8'
	t.priority = 3 
	t.status = 'TEST'
	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
	t.sprint_id = s2.id
	t.save
end

2.times do 
	t = Task.new
	t.hours = '8'
	t.priority = 3 
	t.status = 'DONE'
	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
	t.sprint_id = s2.id
	t.save
end


89.times do 
	t = Task.new
	t.hours = '6'
	t.priority = 1 
	t.status = 'TODO'
	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
	t.sprint_id = s3.id
	t.save
end

4.times do 
	t = Task.new
	t.hours = '5'
	t.priority = 3 
	t.status = 'ONGOING'
	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
	t.sprint_id = s3.id
	t.save
end

12.times do 
	t = Task.new
	t.hours = '8'
	t.priority = 3 
	t.status = 'TEST'
	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
	t.sprint_id = s3.id
	t.save
end

3.times do 
	t = Task.new
	t.hours = '8'
	t.priority = 1 
	t.status = 'DONE'
	t.storie = 'As a Scrum Master I want to see a dashboard with all taks by every project'
	t.sprint_id = s3.id
	t.save
end



