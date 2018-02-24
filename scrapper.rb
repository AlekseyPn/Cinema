# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
COUNTRY = 'Country:'
TOP_URL = 'http://www.imdb.com/chart/top'
FILE_NAME = 'test.txt'

def get_movie_details(link)
  movie_url = get_movie_url link
  movie_page = get_page movie_url
  title = movie_page.at_css('h1').children.first.text
  year = movie_page.at_css('#titleYear a').text
  date = movie_page.at_css('[itemprop="datePublished"]')['content']
  genre = movie_page.css('.subtext span[itemprop="genre"]').map(&:text).join(',')
  country = movie_page.css('#titleDetails h4').select { |block| block.text == 'Country:' }.first.next_element.text
  runtime = "#{movie_page.at_css('[itemprop="duration"]')['datetime'].gsub(/[A-z]/, '')} min"
  rating = movie_page.at_css('[itemprop="ratingValue"]').text.strip
  actors = movie_page.css('[itemprop="actors"] [itemprop="name"]').map(&:text).join(', ').strip
  director = movie_page.at_css('[itemprop="director"]').text.strip
  [movie_url, title, year, country, date, genre, runtime, rating, director, actors]
end

def get_movie_url(movie)
  href_value = movie.at_css('.titleColumn a')['href']
  short_url "http://www.imdb.com/#{href_value}"
end

def short_url(url)
  url.split('/?').inject { |left, right| "#{left}/?#{right.split('&').last}" }
end

def get_page(url)
  Nokogiri::HTML(open(url))
end

def rating_links(page)
  page.css('.lister-list tr')
end

movies_page = get_page TOP_URL
movies_file = File.open('test.txt', 'w')
rating_links(movies_page)
  .map { |link| get_movie_details link }
  .each do |movie|
    movies_file.puts movie.join('|')
  end
