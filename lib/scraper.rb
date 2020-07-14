require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  #get_page
  # use Nokogiri to get the HTML from a web page
  # This method should contain only the code for getting the HTML document
  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  #get_courses
  # use a CSS selector to return an array of Nokogiri XML elements representing the courses described on the web page we are scraping
  # This method should operate on the HTML page (which is the return value of the .get_page method) and return the collection of Nokogiri XML elements that describe each course
  def get_courses
    self.get_page.css(".post")
  end

  #make_courses
  # iterate over the courses array returned by #get_courses and create a new Course instance out of each array element
  # This method should operate on the collection of course offering Nokogiri XML elements that was returned by the .get_courses method
  def make_courses
    self.get_courses.each do |post| # grab an array-like collection of course elements from the page
      course = Course.new # make a new Course instance for each course
      course.title = post.css("h2").text # assign scraped title to Course instance
      course.schedule = post.css(".date").text # assign scraped schedule to Course instance
      course.description = post.css("p").text # assign scraped description to Course instance
    end
  end

  #print_courses
  # call on .make_courses and then iterate over all of the courses that get created to `puts` out a list of course offerings
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

end

# print all Courses
Scraper.new.print_courses









=begin
  # For each iteration over the collection of Nokogiri XML elements returned to us by the doc.css(".post") line, we are making a new instance of the Course class and giving that instance the title, schedule and description extracted from the XML

  # 1. grab an array-like collection of course elements from the page
  doc.css("post").each do |post|
    course = Course.new # 2. make a new Course instance for each course
    course.title = post.css("h2").text # 3. assign scraped title to Course instance
    course.schedule = post.css(".date").text # 4. assign scraped schedule to Course instance
    course.description = post.css("p").text # 5. assign scraped description to Course instance
  end
=end
