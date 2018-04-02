# frozen_string_literal: true

require_relative '../moviee.rb'
require 'factory_bot'
require_relative './factory.rb'
RSpec.describe Moviee do
  let(:movies) { FactoryBot.build_list(:moviee, 10) }
  describe '#all' do
    it 'return all movies' do
      puts movies.first.date
      puts movies.first.genre
    end
  end
end
