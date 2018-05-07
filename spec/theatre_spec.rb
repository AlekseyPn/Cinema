# frozen_string_literal: true

RSpec.describe Theatre do
  let!(:theatre) { FactoryBot.build(:theatre) }
  describe '#show' do
    let(:current_date) { DateTime.now }
    let(:end_time) { (current_date + (102 / (24 * 60).to_f)).strftime('%H:%M:%S') }
    it 'check show correct movie by time' do
      expect(theatre.show('11:00'))
        .to eq("Now showing: The Wizard of Oz #{current_date.strftime('%H:%M:%S')} - #{end_time}")
    end
  end
  describe '#when?' do
    it 'show when you can see movie' do
      expect(theatre.when?('V for Vendetta'))
        .to eq('You can watch V for Vendetta in the evening from 17 to 24')
    end
  end
end
