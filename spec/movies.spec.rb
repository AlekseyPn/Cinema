# frozen_string_literal: true

require_relative '../movies_collection.rb'
require_relative '../movie.rb'
require 'factory_bot'
require_relative '../factory.rb'
RSpec.describe MoviesCollection do
  let(:movies) { FactoryBot.create(:movies_collection) }
  describe 'init' do
    subject { movies.all }
    it { is_expected.not_to be_empty }
  end
end
