class HtmlBuilder

  def build_ul(&block)
    build_wrapper('ul', &block)
  end

  def build_li(&block)
    build_wrapper('li', &block)
  end

  def build_link(text, url)
    "<a href=\"#{url}\">#{text}</a>"
  end

  private
  def build_wrapper(tag, &block)
    # want to consider what should and should not be allowed to be passed in as a 'tag'
    # maybe better exception handling, but this manages the case
    # where no block is passed.
    inner_html = block.call if block
    "<#{tag}>#{inner_html}</#{tag}>"
  end
end
