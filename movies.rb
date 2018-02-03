# frozen_string_literal: true

movies_names = ARGV
KNOWN_MOVIES = ['Avengers', 'Galaxy guardians', 'Iron Man'].freeze
def check_movie_description(movie)
  if movie == 'Elki'
    'Elki is a bad movie'
  elsif KNOWN_MOVIES.include?(movie)
    "#{movie} is a good movie"
  else
    "Haven't seen #{movie} yet"
  end
end

def favourite_movies(movies_names)
  movies_names.each do |movie|
    puts check_movie_description movie
  end
end
favourite_movies movies_names
