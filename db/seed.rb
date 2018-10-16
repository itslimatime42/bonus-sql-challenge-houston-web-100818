# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
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
