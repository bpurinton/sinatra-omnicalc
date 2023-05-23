# first we import sinatra so we have access to its 
# objects and methods
require 'sinatra'

# we need to require this gem to get the cookies hash
require 'sinatra/cookies'

# we need to require this gem to open a json URL
require "open-uri"

# require active record to make use of it
require 'active_record'

# Set up the database connection
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'development.db'
)

# Define the Task model
class Task < ActiveRecord::Base
  # Attributes
  # - id: integer (primary key)
  # - name: string
  # - description: text
  # - created_at: datetime
  # - updated_at: datetime
end

# Migrate the database
if not File.file?('./development.db')
  ActiveRecord::Migration.create_table :tasks do |t|
    t.string :name
    t.text :description
    t.timestamps
  end
end

# render a tasks index
get('/tasks') do
  @tasks = Task.all
  erb(:tasks_index)
end

# create a new task
get('/tasks/create') do
  @name = params.fetch("query_task_name")
  @description = params.fetch("query_task_description")

  @task = Task.new
  @task.name = @name
  @task.description = @description
  @task.save
  
  redirect('/tasks')
end

# show page for a task
get('/tasks/:path_id') do
  @task_id = params.fetch("path_id")

  @list_of_tasks = Task.where({ :id => @task_id })
  @task = @list_of_tasks.first

  erb(:tasks_show)
end

# delete task
get('/update_task/:path_id') do
  @task_id = params.fetch("path_id")

  @name = params.fetch("query_task_name")
  @description = params.fetch("query_task_description")

  @list_of_tasks = Task.where({ :id => @task_id })
  @task = @list_of_tasks.first

  @task.name = @name
  @task.description = @description
  @task.save
  
  redirect('/tasks/' + @task_id)
end

# edit task
get('/delete_task/:path_id') do
  @task_id = params.fetch("path_id")

  @list_of_tasks = Task.where({ :id => @task_id })
  @task = @list_of_tasks.first
  @task.destroy

  redirect('/tasks')
end

get('/') do
  redirect('/square/new')
end

get('/square/new') do
  puts params
  erb(:square_form)
end

get('/square/results') do
  # puts params
  # params = {"elephant"=>"42"}
  
  @num = params.fetch("elephant").to_f
  @square_of_num = @num * @num

  cookies[:number_to_square] = @num
  cookies[:number_squared] = @square_of_num

  erb(:square_results)
end

get('/random/results') do
  # puts params
  # params = {"user_min"=>"1.5", "user_max"=>"4.5"}

  @lower = params.fetch("user_min").to_f
  @upper = params.fetch("user_max").to_f
  
  erb(:random_results)
end

get('/dice/:number/:sides') do
  # puts params
  # params = {"number"=>"4", "sides"=>"5"}

  @number_of_dice = params.fetch("number")
  @sides_per_dice = params.fetch("sides")

  erb(:dice_roll)
end

get('/forex') do
  url = "https://api.exchangerate.host/symbols"
  raw_data = URI.open(url).read
  parsed_data = JSON.parse(raw_data)
  @symbols = parsed_data.fetch("symbols").keys
  erb(:currency_list)
end

get('/forex/:currency_one') do
  @currency_one = params.fetch("currency_one")
  url = "https://api.exchangerate.host/symbols"
  raw_data = URI.open(url).read
  parsed_data = JSON.parse(raw_data)
  @symbols = parsed_data.fetch("symbols").keys
  erb(:currency_convert)
end

get('/forex/:currency_one/:currency_two') do
  @currency_one = params.fetch("currency_one")
  @currency_two = params.fetch("currency_two")
  url = "https://api.exchangerate.host/convert?from=" + @currency_one + "&to=" + @currency_two
  raw_data = URI.open(url).read
  parsed_data = JSON.parse(raw_data)
  @rate = parsed_data.fetch("result")
  erb(:currency_conversion)
end
