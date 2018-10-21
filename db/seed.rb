# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
<<<<<<< HEAD
require_relative '../config/environment'
require 'pry'
require 'sqlite3'

csv = CSV.read("daily_show_guests.csv")
columns = csv.shift
columns = columns.map do |column|
  if column == "Group"
    "Category"
  else
    column
  end
end

csv.each do | row |
  sql = <<-SQL
    INSERT INTO guests (#{columns[0]}, #{columns[1]}, #{columns[2]}, #{columns[3]}, #{columns[4]})
    VALUES (?,?,?,?,?)
  SQL
  DB[:conn].execute(sql, row[0], row[1], row[2], row[3], row[4])
end
=======
require 'pry'
require 'sqlite3'
require_relative './Guest'
require_relative './helpers'
require_relative './sql_runner'

guest_data = parse_csv("daily_show_guests.csv")

guests = create_guest_array(guest_data)

@db = SQLite3::Database.new(':memory:')

@sql_runner = SQLRunner.new(@db)

@sql_runner.execute_schema_sql

write_insert_file("lib/insert.sql", guests)

@sql_runner.execute_insert_sql
>>>>>>> d68b9f448017d55769f0b590f9cb5dddd055cd5e
