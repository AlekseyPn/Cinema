# frozen_string_literal: true

require 'factory_bot'
require 'ffaker'
require 'ostruct'

FactoryBot.define do  
  factory :moviee do
    url { FFaker::Internet.http_url }
    title { FFaker::Movie.title }
    year { FFaker::Vehicle.year }
    country { FFaker::Address.country }
    date { FFaker::IdentificationESCO.expedition_date.strftime('%Y-%m-%d') }
    genre { %w[Comedy Triller Horror Anime Drama].sample }
    runtime '143min'
    rating '8.3'
    producer { FFaker::Name.name }
    actors { FFaker::Name.name }    
    initialize_with { new(OpenStruct.new(attributes), Array.new()) }
  end
end
