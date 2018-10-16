class Guest

  attr_reader :year, :occupation, :show_date, :category, :raw_guest_list

  @@all = []

  def initialize(guest_property_array)
    @year = guest_property_array[0]
    @occupation = guest_property_array[1]
    @show_date = guest_property_array[2]
    @category = guest_property_array[3]
    @raw_guest_list = guest_property_array[4]
    @@all << self
  end

  def self.all
    @@all
  end

end
