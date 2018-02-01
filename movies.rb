# frozen_string_literal: true

def movies(name)
  case name
  when 'Titanic'
    print 'Titanic is a good movie'
  when 'Elki'
    print 'Elki is a bad movie'
  else
    print "Haven\'t seen #{name} yet"
  end
end

puts movies ARGV[0].to_s
