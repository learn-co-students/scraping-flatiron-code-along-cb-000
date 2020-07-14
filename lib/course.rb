require_relative './concerns/mass_assignment'

class Course
  include MassAssignment::InstanceMethods
  attr_accessor :title, :schedule, :description
  @@all = []

  def initialize(attributes={title: ""})
    super(attributes)
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    self.all.clear
  end

end
