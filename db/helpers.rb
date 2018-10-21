require 'pry'

# parses the csv, returns an array of instances of Guests
def parse_csv(csv_file)

  # parses file into a single string, splits string by new line into elements of an array
  file_string = File.read(csv_file)
  file_array = file_string.split("\n")

  # removes 1st element from array, which contains column titles
  column_titles = file_array.shift.split(",")

  # iterates over the lines of the array and separates each element by comma
  guests_array = file_array.map do |guest|
    new_guest = guest.split(",")
    new = new_guest.map do |property|
      property.sub("'", "")
    end
  end
end

# takes an array of guest data and converts it into an array of Guest instances
def create_guest_array(raw_guest_data_array)

  # create new Guest instance for each guest in guests_array
  raw_guest_data_array.each do |guest|
    Guest.new(guest)
  end

  # returns an array of Guest instances
  Guest.all
end

def write_insert_file(file_destination, guest_array)
  File.write(file_destination, "")
  f = File.open("#{file_destination}","a")

  guest_array.each do |guest|

    f.write("INSERT INTO 'guests' ('category', 'occupation', 'raw_guest_list', 'show', 'year') VALUES ('#{guest.category}', '#{guest.occupation}', '#{guest.raw_guest_list}', '#{guest.show_date}', #{guest.year});\n")
  end
  f.close
end
