# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
#puts 'ROLES'
#YAML.load(ENV['ROLES']).each do |role|
# Role.find_or_create_by_name({ :name => role }, :without_protection => true)
#  puts 'role: ' << role
#end
#puts 'DEFAULT USERS'
#user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
#puts 'user: ' << user.name
#user.add_role :admin

12.times do |i|
  Task.create(storie: "As a SCRUM MASTER i want to delete any project", priority: 3, hours: "#{i}:00", status: "TODO", sprint_id: 1)
end

6.times do |i|
  Task.create(storie: "As a SCRUM MASTER i want to delete any project", priority: 2, hours: "#{i}:00", status: "ONGOING", sprint_id: 1)
end

3.times do |i|
  Task.create(storie: "As a SCRUM MASTER i want to delete any project", priority: 2, hours: "#{i}:00", status: "DONE", sprint_id: 1)
end

32.times do |i|
  Task.create(storie: "As a SCRUM MASTER i want to delete any project", priority: 3, hours: "#{i}:00", status: "TODO", sprint_id: 2)
end

6.times do |i|
  Task.create(storie: "As a SCRUM MASTER i want to delete any project", priority: 2, hours: "#{i}:00", status: "ONGOING", sprint_id: 2)
end

2.times do |i|
  Task.create(storie: "As a SCRUM MASTER i want to delete any project", priority: 2, hours: "#{i}:00", status: "DONE", sprint_id: 2)
end

6.times do |i|
  Task.create(storie: "As a SCRUM MASTER i want to delete any project", priority: 3, hours: "#{i}:00", status: "TODO", sprint_id: 3)
end

2.times do |i|
  Task.create(storie: "As a SCRUM MASTER i want to delete any project", priority: 2, hours: "#{i}:00", status: "ONGOING", sprint_id: 3)
end

1.times do |i|
  Task.create(storie: "As a SCRUM MASTER i want to delete any project", priority: 2, hours: "#{i}:00", status: "DONE", sprint_id: 3)
end
