# frozen_string_literal: true

# movie_name = ARGV.first
# def movies(name)
#   case name
#   when 'Titanic'
#     'Titanic is a good movie'
#   when 'Elki'
#     'Elki is a bad movie'
#   else
#     "Haven\'t seen #{name} yet"
#   end
# end

# puts movies movie_name
movies_names = ARGV

def favourite_movies(names)
  names.each do |movie|
    if ['Avengers', 'Galaxy guardians', 'Iron Man'].include?(movie)
      puts "#{movie}. Oh it's my favourite film"
    else
      puts "#{movie}. What? No, it's not my favourite film!"
    end
  end
end

puts favourite_movies movies_names
