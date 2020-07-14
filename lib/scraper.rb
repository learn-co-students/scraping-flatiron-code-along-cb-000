require 'nokogiri'
require 'open-uri'
# require 'pry'

require_relative './course.rb'

class Scraper

  def get_page()
    return Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
  end

  def get_courses()
    return self.get_page.css("section#course-grid section.posts-holder article.post:not(.empty-event)")
  end

  def make_courses()
    self.get_courses.each{|course_element|
      course_attributes = Hash.new
      course_attributes["title"] = course_element.css("h2").text
      course_attributes["schedule"] = course_element.css("em.date").text
      course_attributes["description"] = course_element.css("p").text
      Course.new(course_attributes)
    }
  end

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

# Scraper.new.print_courses
