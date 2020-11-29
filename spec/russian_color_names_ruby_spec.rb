require 'russian_color_names_ruby'
RSpec.describe RussianColorNamesRuby do
  bad_values = %w(#f #ff ffff 0234 wzz)
  red_in_hex = %w(#ff0000 ff0000 #f00 f00)

  it "has nil, because of wrong value" do
    bad_values.each do |bv|
      expect(RussianColorNamesRuby.show_color_name(bv)).to eql(nil)
    end
  end

  it "shows red color in rgb" do
    red_in_hex.each do |red|
      expect(RussianColorNamesRuby.show_color_name(red)).to eql("Красный")
    end
  end
end