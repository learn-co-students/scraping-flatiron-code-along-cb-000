# require 'nokogiri'
# require 'open-uri'

class Course
  attr_accessor :title,:schedule,:description
  @@all = []

  def initialize()
    @@all << self
  end #initialize
  # ***********************************************************************self
  def self.all
    # @@all << self
    @@all
  end #self.all

  def self.reset_all
    @@all.clear
  end #reset
end #Course
