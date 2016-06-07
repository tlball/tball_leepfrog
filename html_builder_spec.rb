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
end

