require_relative '../config/environment'
require_relative '../config/sql_runner'
require_relative '../db/seed.rb'
require 'pry'


# Who did Jon Stewart have on the Daily Show the most? => FAREED ZAKARIA (19 appearances)
def guest_with_most_appearances
  @db.execute("SELECT raw_guest_list FROM guests GROUP BY raw_guest_list ORDER BY COUNT(id) DESC LIMIT 1")
end

# What was the most popular profession of guest for each year? => ACTOR FOR EVERY YEAR
def most_common_profession_by_year
  year = 1999
  professions = []
  while year < 2016
    profession = [year]
    profession << @db.execute("SELECT occupation FROM guests WHERE year = ? GROUP BY occupation ORDER BY COUNT(id) DESC LIMIT 1",year)

    professions << profession
    year += 1
  end
  professions
end

# What profession was on the show most overall? => ACTOR (596 appearances)
def most_common_profession_overall
  @db.execute("SELECT occupation FROM guests GROUP BY occupation ORDER BY COUNT(id) DESC LIMIT 1")
end

# How many people did Jon Stewart have on with the first name of Bill? => 61
def how_many_bills
  @db.execute("SELECT COUNT(id) FROM guests WHERE raw_guest_list LIKE '%Bill%'")
end

# What dates did Patrick Stewart appear on the show? => 04/12/00, 04/21/03, 11/07/13
def patrick_stewart_appearance_dates
  @db.execute("SELECT show FROM guests WHERE raw_guest_list = 'Patrick Stewart'")
end

# Which year had the most guests? => 2000 (169 guests)
def year_with_most_guests
  @db.execute("SELECT year FROM guests GROUP BY year ORDER BY COUNT(id) DESC LIMIT 1")
end

# What was the most popular "Group" for each year Jon Stewart hosted?
def most_common_group_by_year
  year = 1999
  groups = []
  while year < 2016
    group = [year]
    group << @db.execute("SELECT category FROM guests WHERE year = ? GROUP BY category ORDER BY COUNT(id) DESC LIMIT 1",year)

    groups << group
    year += 1
  end
  groups
end

binding.pry
0
