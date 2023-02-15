module TablerIcons

  require 'nokogiri'

  class Icon

    DEFAULT = {
      size:             24,
      stroke_width:     2,
      color:            'currentColor',
      classes:          []
    }

    attr_reader :symbol
    attr_accessor :body, :options

    def initialize(symbol, options = {})
      @symbol = symbol.to_s # we assume that the icon selector symbol comes in as a symbol
      @symbol.gsub!('_', '-') # since a hyphen is not allowed in a symbol and tabler uses the hyphen we must swap an underscore for a hyphen

      @options = DEFAULT.merge(options)

      icon = get_icon(@symbol)

      @body = Nokogiri::XML.parse(icon).at_css('svg')
      @body.set_attribute('stroke-width', @options.fetch(:stroke_width))
      @body.set_attribute('stroke', @options.fetch(:color))

      remove_outer_box
      set_dimensions
      set_classes

    end

    def set_dimensions
      @body.set_attribute('height', @options.fetch(:size))
      @body.set_attribute('width', @options.fetch(:size))
      @body.set_attribute('viewBox', viewbox)
      @body.set_attribute('preserveAspectRatio', "xMidYMid meet")
    end

    def viewbox
      "0 0 #{@options.fetch(:size)} #{@options.fetch(:size)}"
    end

    def set_classes
      @body.add_class(@options.fetch(:classes).map{ |r| r.to_s }.join(' '))
    end

    def remove_outer_box
      element = @body.at_css('path[d="M0 0h24v24H0z"]')
      element.remove
    end

    def get_icon(icon)
      # File.read("icons/#{icon}.svg")
      File.read(File.join(TablerIcons.root, 'icons', "#{icon}.svg"))
    end
  end
end