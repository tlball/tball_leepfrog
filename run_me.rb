require './navlinks/'

navlinks = Navlinks.new

puts ""
puts "Coding Exercise by Tricia Ball 6/8/2016"
puts ""
puts "Here are my results from this coding exercise."
puts "This output should match that of the sample data, with the exception of the title and class attributes do not exist"
puts "Those could be added in by modifying the HtmlBuilder class to accept optional attributes, and then added to the html generator"
puts ""
puts "This is the unformatted output for campus 'university' and path '/aboutjwu/academicdirectories/'"
puts navlinks.create_navlinks("university", "/aboutjwu/academicdirectories/")
puts ""
puts "This is the unformatted output for campus 'other' and path '/aboutjwu/academicdirectories/'"
puts navlinks.create_navlinks("other", "/aboutjwu/academicdirectories/")

