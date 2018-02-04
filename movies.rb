# frozen_string_literal: true

movies_names = ARGV
KNOWN_MOVIES = ['Avengers', 'Galaxy guardians', 'Iron Man'].freeze
def check_movie_description(movie)
  case movie
  when 'Elki'
    'Elki is a bad movie'
  when KNOWN_MOVIES.find{ |m| m == movie }
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
