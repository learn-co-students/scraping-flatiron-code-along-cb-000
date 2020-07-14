require 'nokogiri'
require 'open-uri'

require_relative './course.rb'

class Scraper
  
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
  
  def get_page(url = "http://learn-co-curriculum.github.io/site-for-scraping/courses")
    return Nokogiri::HTML(open("#{url}"))
  end
  
  def get_courses(element = "post")
    return self.get_page.css(".#{element}")
  end
  
  def make_courses
    self.get_courses.each{|element| 
    Course.new(element.css("h2").text, element.css(".date").text, element.css("p").text)
    }
  end
    
  
end



