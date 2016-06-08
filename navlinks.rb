require './html_builder'
require 'cgi'
require './navlink_records'

class Navlinks
  include NavlinkRecords

  def generate_html(campus, path_pieces)
    records = find_records(campus, path_pieces.first)
    html = builder.build_ul do
      list_items = path_pieces.first == "/" ? root_link : ""
      records.each do |record|
        links = ""
        list_items << builder.build_li do
          links <<  builder.build_link(CGI.escapeHTML(record[:name]), record[:url])
          if path_pieces.include?(record[:url])
            links << generate_html(campus, path_pieces[1..-1])
          else
            links << ""
          end
          links
        end
      end
      list_items
    end
    html
  end

  def find_records(campus, path)
    NAVLINKS.select { |link| link[:campus] == campus && link[:section] == path }
  end

  def breakdown_path(path)
    path_pieces = []
    index = path.index('/')
    until index.nil? do
      path_pieces << path[0, index + 1]
      index = path.index('/', index + 1)
    end
    path_pieces
  end

  private
  def builder
    @builder ||= HtmlBuilder.new
  end

  def root_link
    builder.build_li do
      builder.build_link("Catalog Home", "/")
    end
  end
end
