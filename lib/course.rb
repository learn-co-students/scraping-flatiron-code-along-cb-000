class Course
  # instance methods
    # has a setter and a getter method for title
    # has a setter and a getter method for a course's schedule
    # has a setter and a getter method for a course's description
  attr_accessor :title, :schedule, :description

  @@all = []

  def initialize
    @@all << self
  end

  # class methods
    # returns an array of all the instances of the Course class
  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end
end
