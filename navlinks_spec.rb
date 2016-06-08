require "./navlinks"

RSpec.describe Navlinks do
  describe "create_navlinks" do
    it "returns the proper navlinks html for the campus and path" do

    end
  end

  describe "#generate_html" do
    it "returns a properly nested unordered list" do
      # This is from the sample data for "other" nav for /aboutjwu/academicdirectories/
      # Removed any tag attributes aside from "href"
      # Can build out HtmlBuilder to accept attributes
      proper_html = '<ul><li><a href="/">Catalog Home</a></li><li><a href="/aboutjwu/">About JWU</a><ul><li><a href="/aboutjwu/letterfromthepresident/">Letter from President</a></li><li><a href="/aboutjwu/historyofjwu/">History of JWU</a></li><li><a href="/aboutjwu/missionandpurposes/">Mission &amp; Principles</a></li><li><a href="/aboutjwu/campuses/">Campus Facilities</a></li><li><a href="/aboutjwu/accreditations/">Accreditations</a></li><li><a href="/aboutjwu/affiliations/">Affiliations</a></li><li><a href="/aboutjwu/nondiscriminationnotice/">Nondiscrimination Notice</a></li><li><a href="/aboutjwu/corporationandtrustees/">Corporation &amp; Trustees</a></li><li><a href="/aboutjwu/universityleadership/">University Leadership</a></li><li><a href="/aboutjwu/academicdirectories/">Academic Directories</a><ul><li><a href="/aboutjwu/academicdirectories/artsandsciences/">Arts &amp; Sciences</a></li><li><a href="/aboutjwu/academicdirectories/business/">Business</a></li><li><a href="/aboutjwu/academicdirectories/culinaryarts/">Culinary Arts</a></li><li><a href="/aboutjwu/academicdirectories/hospitality/">Hospitality</a></li></ul></li><li><a href="/aboutjwu/departmentdirectories/">Department Directories</a></li></ul></li><li><a href="/programsofstudy/">Programs of Study</a></li><li><a href="/academicinformation/">Academic Information</a></li><li><a href="/admissions/">Admissions</a></li><li><a href="/financingyourdegree/">Financing Your Degree</a></li><li><a href="/studentservices/">Student Services</a></li></ul>'
      navlinks = Navlinks.new
      html = navlinks.generate_html("other", ['/', '/aboutjwu/', '/aboutjwu/academicdirectories/'])
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
