require "./navlinks"

RSpec.describe Navlinks do
  describe "#generate_html" do
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

  describe "#breakdown_path" do
    it "returns [/] if path == /" do
      path = "/"
      navlinks = Navlinks.new
      expect(navlinks.breakdown_path(path)).to eq([path])
    end

    it "returns array with root and its subclass when path contains 1 subclass" do
      path = "/aboutwju/"
      navlinks = Navlinks.new
      expect(navlinks.breakdown_path(path)).to eq(['/', path])
    end

    it "returns all path parts of a given path" do
      path = "/aboutjwu/academicdirectories/"
      navlinks = Navlinks.new
      expect(navlinks.breakdown_path(path).size).to eq(3)
      expect(navlinks.breakdown_path(path)).to eq(['/', '/aboutjwu/', path])
    end

  end
end
