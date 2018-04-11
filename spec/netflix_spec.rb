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
    before { netflix.pay(25) }
    it 'show movie by filter' do
      expect(netflix.show(genre: 'Comedy', period: :classic)).to eq('Now showing: Some Like It Hot some period')
    end
  end
  describe '#how_much?' do
    it 'get how much will it cost to view' do
      expect(netflix.how_much?('Gran Torino')).to be 5
    end
  end
end
