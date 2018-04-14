# frozen_string_literal: true

RSpec.describe Theatre do
  let!(:theatre) { FactoryBot.build(:theatre) }
  describe '#show' do
    let(:current_date) { DateTime.now }
    let(:end_time) { (current_date + (125 / (24 * 60).to_f)).strftime('%H:%M:%S') }
    it 'check show correct movie by time' do
      expect(theatre.show('13:00'))
        .to eq("Now showing: The Apartment #{current_date.strftime('%H:%M:%S')} - #{end_time}")
    end
  end
end
