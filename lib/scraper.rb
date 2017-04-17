require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper



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

  def get_page
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end
  def get_courses
    html = get_page
    html.css(".post")
  end
  def make_courses
    courses = get_courses
    courses.each do |course|
      c = Course.new
      c.title = course.css("h2").text
      c.schedule = course.css(".date").text
      c.description = course.css("p").text
    end
  end

end



Scraper.new.get_courses
