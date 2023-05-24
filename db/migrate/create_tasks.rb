require 'active_record'

# Set up the database connection
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.db'
)

ActiveRecord::Migration.create_table :tasks do |t|
  t.string :name
  t.text :description
  t.timestamps
end
