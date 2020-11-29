require "russian_color_names_ruby/version"
require 'yaml'

SIX_DIGIT_HEX_COLOR_REGEX = /^#([A-Fa-f0-9]{6})$/
HEX_COLOR_REGEX = /^([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/

module RussianColorNamesRuby
  class Error < StandardError; end

  class << self

    @@data = YAML.load_file("#{__dir__}/data/colors.yml");

    def show_raw_data
      return @@data
    end

    def show_random
     color = @@data.sample
     color = color[:name]
    end

    def show_color_name(symbols_from_input)
      symbols_from_input = normalized_color(symbols_from_input)
      if !!(symbols_from_input =~ SIX_DIGIT_HEX_COLOR_REGEX)
        color = @@data.select{|key, hash| key[:hex] == symbols_from_input }
        begin
          color[0][:name]
        rescue
          nil
        end
      end
    end

    def normalized_color(symbols_from_input)
      symbols_from_input.gsub!('#','')
      if !!(symbols_from_input =~ HEX_COLOR_REGEX)

        current_pattern =
        case symbols_from_input.length
        when 3
          /./
        when 6
          /../
        end
        prepared_array = symbols_from_input.scan current_pattern

        prepared_array = prepared_array.map do |d|
          symbols =
          case symbols_from_input.length
          when 3
            d * 2
          when 6
            d
          end
          symbols
        end

        color = prepared_array.join
        color = color.insert(0, '#')
        return color.downcase
      end
    end

  end
end