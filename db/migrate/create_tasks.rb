require 'active_record'
require './config/environment'

ActiveRecord::Migration.create_table :tasks do |t|
  t.string :name
  t.text :description
  t.timestamps
end
