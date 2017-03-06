require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper

  def get_page
    return @doc if @doc

    url = "http://learn-co-curriculum.github.io/site-for-scraping/courses"
    @doc = Nokogiri::HTML(open(url))
  end

  def get_courses
    get_page.search('.post')
  end

  def make_courses
    get_courses.each do |course_element|
      Course.new.tap do |course|
        course.title = course_element.search('h2').text
        course.schedule = course_element.search(".date").text
        course.description = course_element.search("p").text
      end
    end
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
