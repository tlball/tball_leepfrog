require "./navlinks"

RSpec.describe Navlinks do
  describe '#find_records' do
    context 'given a campus and path' do
      it 'returns the correct list of records' do
        navlinks = Navlinks.new
        found_records = navlinks.find_records('other', '/aboutjwu/academicdirectories/')
        expect(found_records.size).to eq(4)
        expect(found_records.map { |record| record[:url]}).to match_array([
          "/aboutjwu/academicdirectories/artsandsciences/",
          "/aboutjwu/academicdirectories/business/",
          "/aboutjwu/academicdirectories/culinaryarts/",
          "/aboutjwu/academicdirectories/hospitality/"
        ])
      end
    end
  end
end
