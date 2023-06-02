require './config/environment'

Task.delete_all

count = 0
while count < 1000 do
  Task.create!(name: "name#{count}", description: "description#{count}")
  count += 1
end
