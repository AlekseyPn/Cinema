# frozen_string_literal: true

movies_names = ARGV
FAVOURITE_MOVIES = ['Avengers', 'Galaxy guardians', 'Iron Man', 'Elki'].freeze
def favourite_movies(movies_names)
  movies_names.each do |movie|
    if movie == 'Elki'
      puts 'Elki is a bad movie'
    elsif FAVOURITE_MOVIES.include?(movie)
      puts "#{movie}. #{favourite_movies_description[movie]}"
    else
      puts "Haven't seen #{movie} yet"
    end
  end
end

puts favourite_movies movies_names
