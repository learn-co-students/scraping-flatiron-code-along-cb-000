class Course
  @@all = []

  attr_accessor :title
  attr_accessor :schedule
  attr_accessor :description

  def initialize
    title = ""
    schedule = ""
    description = ""
    @@all << self
  end



  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end
end
