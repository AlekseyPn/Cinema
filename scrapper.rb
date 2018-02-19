# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

TOP_URL = 'http://www.imdb.com/chart/top'
uri_response = open(TOP_URL)
movies_top_page = Nokogiri::HTML(uri_response)

movie = movies_top_page.css('.lister-list tr').first
href_value = movie.at_css('.titleColumn a')['href']
movie_url = "http://www.imdb.com/#{href_value}"
movie_uri_response = open(movie_url)
movie_page = Nokogiri::HTML(movie_uri_response)

title_el = movie_page.at_css('h1')
title = title_el.children.first.text
year = title_el.at_css('span a').text
movie_details = movie_page.at_css('#titleDetails')
date = movie_page.at_css('[itemprop="datePublished"]')['content']
genres = movie_page.css('.subtext span[itemprop="genre"]').map{|genre| genre.text}.join(',')
puts genres
