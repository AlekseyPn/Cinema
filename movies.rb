# frozen_string_literal: true

movies_names = ARGV
FAVOURITE_MOVIES = [
  ['Avengers', 'Galaxy guardians', 'Iron Man'],
  ['Awesome film', 'Great Film', 'Iron film']
].freeze
def favourite_movies(movies_names)
  favourite_movies_description = Hash[*FAVOURITE_MOVIES.transpose.flatten]
  movies_names.each do |movie|
    if !favourite_movies_description[movie].nil?
      puts "#{movie}. #{favourite_movies_description[movie]}"
    else
      puts "#{movie}. What? No, it's not my favourite film!"
    end
  end
end

puts favourite_movies movies_names
