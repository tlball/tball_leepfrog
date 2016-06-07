require "./navlinks"

RSpec.describe Navlinks do
  describe "#generate_html" do
    it "returns a string" do
      records = [
        {campus:"other", section:"/aboutjwu/academicdirectories/", name:"Arts & Sciences", url:"/aboutjwu/academicdirectories/artsandsciences/"},
        {campus:"other", section:"/aboutjwu/academicdirectories/", name:"Business", url:"/aboutjwu/academicdirectories/business/"},
        {campus:"other", section:"/aboutjwu/academicdirectories/", name:"Culinary Arts", url:"/aboutjwu/academicdirectories/culinaryarts/"},
        {campus:"other", section:"/aboutjwu/academicdirectories/", name:"Hospitality", url:"/aboutjwu/academicdirectories/hospitality/"}
      ]
      navlinks = Navlinks.new
      html = navlinks.generate_html("other", records)
      expect(html).to be_a(String)
    end

    it "returns an unordered list" do
      records = [
        {campus:"other", section:"/aboutjwu/academicdirectories/", name:"Arts & Sciences", url:"/aboutjwu/academicdirectories/artsandsciences/"},
        {campus:"other", section:"/aboutjwu/academicdirectories/", name:"Business", url:"/aboutjwu/academicdirectories/business/"},
        {campus:"other", section:"/aboutjwu/academicdirectories/", name:"Culinary Arts", url:"/aboutjwu/academicdirectories/culinaryarts/"},
        {campus:"other", section:"/aboutjwu/academicdirectories/", name:"Hospitality", url:"/aboutjwu/academicdirectories/hospitality/"}
      ]
      navlinks = Navlinks.new
      html = navlinks.generate_html("other", records)
      puts html
      expect(html).to start_with("<ul>")
      expect(html).to end_with("</ul>")
    end

    it "returns a properly nested unordered list" do
      # This is from the sample data for "other" nav for /aboutjwu/academicdirectories/
      # Changed '&amp;' to an '&'
      proper_html = "<ul><li><a href='/aboutjwu/academicdirectories/artsandsciences/'>Arts & Sciences</a></li><li><a href='/aboutjwu/academicdirectories/business/'>Business</a></li><li><a href='/aboutjwu/academicdirectories/culinaryarts/'>Culinary Arts</a></li><li><a href='/aboutjwu/academicdirectories/hospitality/'>Hospitality</a></li></ul>"
      records = [
        {campus:"other", section:"/aboutjwu/academicdirectories/", name:"Arts & Sciences", url:"/aboutjwu/academicdirectories/artsandsciences/"},
        {campus:"other", section:"/aboutjwu/academicdirectories/", name:"Business", url:"/aboutjwu/academicdirectories/business/"},
        {campus:"other", section:"/aboutjwu/academicdirectories/", name:"Culinary Arts", url:"/aboutjwu/academicdirectories/culinaryarts/"},
        {campus:"other", section:"/aboutjwu/academicdirectories/", name:"Hospitality", url:"/aboutjwu/academicdirectories/hospitality/"}
      ]
      navlinks = Navlinks.new
      html = navlinks.generate_html("other", records)
      expect(html).to eq(proper_html)
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
