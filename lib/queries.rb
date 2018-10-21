<<<<<<< HEAD
# Write methods that return SQL queries for each part of the challeng here
require_relative '../config/environment'
=======
require_relative '../config/environment'
require_relative '../config/sql_runner'
>>>>>>> d68b9f448017d55769f0b590f9cb5dddd055cd5e
require_relative '../db/seed.rb'
require 'pry'


<<<<<<< HEAD
# FAREED ZAKARIA (19 appearances)
def guest_with_most_appearances
  DB[:conn].execute("SELECT Raw_Guest_List FROM guests GROUP BY Raw_Guest_List ORDER BY COUNT(id) DESC LIMIT 1")[0][0]
=======
# Who did Jon Stewart have on the Daily Show the most? => FAREED ZAKARIA (19 appearances)
def guest_with_most_appearances
  @db.execute("SELECT raw_guest_list FROM guests GROUP BY raw_guest_list ORDER BY COUNT(id) DESC LIMIT 1")
>>>>>>> d68b9f448017d55769f0b590f9cb5dddd055cd5e
end

# What was the most popular profession of guest for each year? => ACTOR FOR EVERY YEAR
def most_common_profession_by_year
  year = 1999
  professions = []
  while year < 2016
    profession = [year]
<<<<<<< HEAD
    profession << DB[:conn].execute("SELECT GoogleKnowlege_Occupation FROM guests WHERE YEAR = ? GROUP BY GoogleKnowlege_Occupation ORDER BY COUNT(id) DESC LIMIT 1",year)[0][0]
=======
    profession << @db.execute("SELECT occupation FROM guests WHERE year = ? GROUP BY occupation ORDER BY COUNT(id) DESC LIMIT 1",year)

>>>>>>> d68b9f448017d55769f0b590f9cb5dddd055cd5e
    professions << profession
    year += 1
  end
  professions
end

# What profession was on the show most overall? => ACTOR (596 appearances)
def most_common_profession_overall
<<<<<<< HEAD
  DB[:conn].execute("SELECT GoogleKnowlege_Occupation FROM guests GROUP BY GoogleKnowlege_Occupation ORDER BY COUNT(id) DESC LIMIT 1")[0][0]
=======
  @db.execute("SELECT occupation FROM guests GROUP BY occupation ORDER BY COUNT(id) DESC LIMIT 1")
>>>>>>> d68b9f448017d55769f0b590f9cb5dddd055cd5e
end

# How many people did Jon Stewart have on with the first name of Bill? => 61
def how_many_bills
<<<<<<< HEAD
  DB[:conn].execute("SELECT COUNT(id) FROM guests WHERE Raw_Guest_List LIKE '%Bill%'")[0][0]
end

# What dates did Patrick Stewart appear on the show? => 04/12/00, 04/21/03, 11/07/13
def patrick_stewart_appearance_dates
  DB[:conn].execute("SELECT Show FROM guests WHERE Raw_Guest_List = 'Patrick Stewart'")
end

# Which year had the most guests? => 2000 (169 guests)
def year_with_most_guests
  DB[:conn].execute("SELECT YEAR FROM guests GROUP BY YEAR ORDER BY COUNT(id) DESC LIMIT 1")[0][0]
end

# What was the most popular "Group" for each year Jon Stewart hosted? [[1999, "Acting"],[2000, "Acting"],[2001, "Acting"],[2002, "Acting"],[2003, "Acting"],[2004, "Acting"],[2005, "Media"],[2006, "Media"],[2007, "Media"],[2008, "Media"],[2009, "Media"],[2010, "Media"],[2011, "Media"],[2012, "Media"],[2013, "Acting"],[2014, "Media"],[2015, "Acting"]]
def most_common_group_by_year
  year = 1999
  groups = []
  while year < 2016
    group = [year]
    group << DB[:conn].execute("SELECT Category FROM guests WHERE YEAR = ? GROUP BY Category ORDER BY COUNT(id) DESC LIMIT 1",year)[0][0]

    groups << group
    year += 1
  end
  groups
=======
  @db.execute("SELECT COUNT(id) FROM guests WHERE raw_guest_list LIKE '%Bill%'")
>>>>>>> d68b9f448017d55769f0b590f9cb5dddd055cd5e
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
