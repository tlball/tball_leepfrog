class HtmlBuilder

  def build_ul(&block)
    # maybe better exception handling, but this manages the case
    # where no block is passed.
    inner_html = block.call if block
    "<ul>#{inner_html}</ul>"
  end


end
