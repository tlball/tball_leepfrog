require './html_builder'

describe HtmlBuilder do
  context "#build_ul" do
    context "given a string" do
      it "returns that string surrounded by ul tags" do
        builder = HtmlBuilder.new
        ul = builder.build_ul do
          "I'm in an unordered list!"
        end
        expect(ul).to eq("<ul>I'm in an unordered list!</ul>")
      end
    end

    context "not given a block" do
      it "returns that string surrounded by ul tags" do
        builder = HtmlBuilder.new
        ul = builder.build_ul
        expect(ul).to eq("<ul></ul>")
      end
    end
  end

  context "#build_li" do
    context "given a string" do
      it "returns that string surrounded by li tags" do
        builder = HtmlBuilder.new
        li = builder.build_li do
          "I'm in a list item!"
        end
        expect(li).to eq("<li>I'm in a list item!</li>")
      end
    end

    context "not given a block" do
      it "returns that string surrounded by li tags" do
        builder = HtmlBuilder.new
        li = builder.build_li
        expect(li).to eq("<li></li>")
      end
    end
  end

  context "#build_link" do
    context "given text and a url" do
      it "returns a proper anchor tag" do
        builder = HtmlBuilder.new
        link = builder.build_link("Click me!", "/some/awesome/place")
        expect(link).to eq("<a href='/some/awesome/place'>Click me!</a>")
      end
    end
  end
end

