# # frozen_string_literal: true

# require 'factory_bot'
# require 'ffaker'

# FactoryBot.define do
#   factory :movies_collection do
#     collection { build_list(:movie, 10) }
#     initialize_with { new('./spec/spec.movies.txt') }
#   end
#   factory :movie do
#     url { FFaker::Internet.http_url }
#     title { FFaker::Movie.title }
#     year { FFaker::Vehicle.year }
#     country { FFaker::Address.country }
#     date { FFaker::IdentificationESCO.expedition_date }
#     genre { %w[Comedy Triller Horror Anime Drama].sample }
#     runtime '143min'
#     rating '8.3'
#     producer { FFaker::Name.name }
#     actors { FFaker::Name.name }
#     initialize_with { new(:movies_collection) }
#   end
# end
