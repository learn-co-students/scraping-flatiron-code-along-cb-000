require 'nokogiri'
require 'open-uri'
require 'pry'
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

  #GET_PAGE
  # The #get_page instance method will be responsible for using Nokogiri and open-uri
  # to grab the entire HTML document from the web page.
  def get_page
    website="https://learn-co-curriculum.github.io/site-for-scraping/courses"  #use scaper
    doc = Nokogiri::HTML(open(website))
    # doc.css(".post").each do |post|
    #   course = Course.new
    #   course.title = post.css("h2").text
    #   course.schedule = post.css(".date").text
    #   course.description = post.css("p").text
    # end #doc.css.post
    # puts "#{Course.all}"
    # binding.pry
    # doc

  end #get_page

  #GET_COURSES
  #The #get_courses instance method will be responsible for using a CSS selector to grab all of the
  #  HTML elements that contain a course. In other words, the return value of this method should be
  #   a collection of Nokogiri XML elements, each of which describes a course offering.
  #    We're going to have to examine the page with the element inspector to find the CSS selector
  #    that contains the courses.
  def get_courses
    # doc.css(".post")
    self.get_page.css(".post")
  end #get_courses

  #MAKE_COURSES
  # The #make_courses method will be responsible for actually instantiating Course objects and giving
  # each course object the correct title, schedule and description attribute that we scraped from the page.
  def make_courses
    get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
    end #doc.css.post
  end #make_courses

end #end scaper

Scraper.new.print_courses
# Scraper.new.get_page
#hero #course-grid .posts-holder .post h2 ->title
#hero #course-grid .posts-holder .post .date ->length
#hero #course-grid .posts-holder .post p ->tetx
