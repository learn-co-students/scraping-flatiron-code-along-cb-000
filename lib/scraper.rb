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

  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")

    Nokogiri::HTML(html)

  end

  def get_courses
    # p get_page.css('.post').first
    get_page.css('.post')
  end

  def make_courses

    get_courses.each do |course|
      item = Course.new()
      item.title = course.css("h2").text
      item.schedule = course.css("em").text
      item.description = course.css("p").text
      # p item

      # binding.pry
      item
    end
    # p ans
    # ans
  end

end

Scraper.new.print_courses
