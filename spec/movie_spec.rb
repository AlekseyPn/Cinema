# frozen_string_literal: true

# MOVIES_DESCRIPTION_KEYS = %i[url title year country date genre runtime rating producer actors].freeze

RSpec.describe Movie do
  # Пока не понял как можно переназначить year для теста, так как объект
  # OpenStruct, a send не работает.
  # describe '#create' do
  #   let!(:movies) { FactoryBot.build(:movie_collection) }
  #   let!(:test_movie) do
  #     OpenStruct.new Hash[MOVIES_DESCRIPTION_KEYS
  #                         .zip(['http://imdb.com/title/tt0084787/?ref_=chttp_tt_164',
  #                               'The Thing',
  #                               '1982',
  #                               'USA',
  #                               '1982-06-25',
  #                               'Horror,Sci-Fi',
  #                               '109 min',
  #                               '8.2',
  #                               'John Carpenter',
  #                               'Kurt Russell,Wilford Brimley,Keith David'])]
  #   end
  #   let!(:movie) { Movie.create(test_movie, movies) }
  #   context 'when ancient' do
  #     before { test_movie.send('year=', '1911') }
  #     it { expect(movie).to have_attributes(period: :ancient) }
  #   end
  # end

  let!(:movie) { FactoryBot.build(:movie) }
  describe '#init' do
    it 'initialize movie model' do
      expect(movie.url).not_to be_empty
    end
  end
  describe '#genre?' do
    it 'exist genre of the movie' do
      expect(movie.genre?('Comedy')).to be_truthy
    end
    it 'genre not exist of the movie' do
      expect { movie.genre?('nonExistentGenre') }.to raise_error(ArgumentError)
    end
  end
  describe '#create' do
    it 'correct detect movie class' do
      expect(movie.instance_of?(Movie)).to be_truthy
    end
  end
end
