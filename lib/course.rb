class Course
  attr_accessor :title, :schedule, :description

  # Class var to track instances
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end
end
