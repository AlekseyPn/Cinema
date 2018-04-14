# frozen_string_literal: true

RSpec.describe Netflix do
  let!(:netflix) { FactoryBot.build(:netflix) }
  describe '#pay' do
    before { netflix.pay(25) }
    it 'payment passes' do
      expect(netflix.deposit).to equal(25)
    end
  end
  describe '#show' do
    let(:current_date) { DateTime.now }
    let(:end_time) { (current_date + (125 / (24 * 60).to_f)).strftime('%H:%M:%S') }
    before { netflix.pay(25) }
    it 'show movie by filter' do
      expect(netflix.show(genre: 'Romance', period: :classic))
        .to eq("Now showing: The Apartment #{current_date.strftime('%H:%M:%S')} - #{end_time}")
    end
  end
  describe '#how_much?' do
    it 'get how much will it cost to view' do
      expect(netflix.how_much?('Gran Torino')).to be 5
    end
  end
end
# 126
