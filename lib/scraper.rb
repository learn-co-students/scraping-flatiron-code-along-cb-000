require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    # binding.pry
    #expect(doc).to be_a(Nokogiri::HTML::Document)
  end

  def get_courses
    get_page.css(".post")
    #expect(course_offerings.class).to be(Nokogiri::XML::NodeSet)
  end
  
  def make_courses
    get_courses.each do |courseXML|
      courseInstance = Course.new()
      courseInstance.title = courseXML.css("h2").text
      courseInstance.schedule = courseXML.css(".date").text
      courseInstance.description = courseXML.css("p").text
    end
    # Course.all.each do |course|
    #   expect(course.title).to be_a String
    #   expect(course.schedule).to be_a String
    #   expect(course.description).to be_a String
    # end
  end
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
end


Scraper.new.print_courses
binding.pry
      