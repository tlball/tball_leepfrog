require "./navlinks"

RSpec.describe Navlinks do
  describe "#generate_html" do
    it "returns a string" do
      navlinks = Navlinks.new
      html = navlinks.generate_html("other", "/")
      expect(html).to be_a(String)
    end

    it "returns an unordered list" do
      navlinks = Navlinks.new
      html = navlinks.generate_html("other", "/")
      puts html
      expect(html).to start_with("<ul>")
      expect(html).to end_with("</ul>")
    end
  end

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
