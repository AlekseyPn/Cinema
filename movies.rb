# frozen_string_literal: true

movies_names = ARGV
KNOWN_MOVIES = ['Avengers', 'Galaxy guardians', 'Iron Man'].freeze
def favourite_movies(movies_names)
  movies_names.each do |movie|
    if movie == 'Elki'
      puts 'Elki is a bad movie'
    elsif KNOWN_MOVIES.include?(movie)
      puts "#{movie} is a good movie"
    else
      puts "Haven't seen #{movie} yet"
    end
  end
end

puts favourite_movies movies_names
