require './config/environment'

Task.delete_all

count = 0
while count < 50000 do
  Task.create!(name: "name#{count}", description: "description#{count}")
  count += 1
end

Task.all.each do |task|
  puts task.name
end
