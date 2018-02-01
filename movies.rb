# frozen_string_literal: true

movie_name = ARGV.first
def movies(name)
  case name
  when 'Titanic'
    'Titanic is a good movie'
  when 'Elki'
    'Elki is a bad movie'
  else
    "Haven\'t seen #{name} yet"
  end
end

puts movies movie_name
