module TablerIcons
  require 'nokogiri'

  class Icon
    class << self
      attr_accessor :default_options
    end

    @default_options = {
      size: 24,
      stroke_width: 2,
      color: 'currentColor',
      classes: [:icon, :tabler_icon]
    }

    attr_reader :symbol
    attr_accessor :body, :options

    def initialize(symbol, options = {})
      @symbol = symbol.to_s
      @symbol.tr!('_', '-')

      @options = self.class.default_options.merge(options)

      icon = get_icon(@symbol)

      @body = Nokogiri::XML.parse(icon).at_css('svg')
      @body.set_attribute('stroke-width', @options[:stroke_width])
      @body.set_attribute('stroke', @options[:color])

      remove_outer_box
      # set_dimensions
      set_classes
    end

    def set_dimensions
      @body.set_attribute('width', @options.fetch(:width, @options[:size]))
      @body.set_attribute('height', @options.fetch(:height, @options[:size]))
      @body.set_attribute('viewBox', viewbox)
      @body.set_attribute('preserveAspectRatio', "xMidYMid meet")
    end

    # def set_dimensions
    #   aspect_ratio = @body['viewBox'].split(' ').last.to_i / @body['viewBox'].split(' ')[2].to_i
    #   @body.set_attribute('height', @options.fetch(:size))
    #   @body.set_attribute('width', @options.fetch(:size) * aspect_ratio)
    #   @body.set_attribute 'viewBox', viewbox
    #   # @body.set_attribute('viewBox', "0 0 #{@options.fetch(:size)} #{@options.fetch(:size)}")
    #   @body.set_attribute('preserveAspectRatio', "xMidYMid meet")
    # end
    
    def viewbox
      size = @options[:size]
      qtr = size/2
      
      [-qtr, -qtr, size, size].join(" ")
    end

    def set_classes
      classes = @options[:classes]
      return unless classes.present?

      @body.remove_attribute('class')
      classes.each do |css_class|
        @body.add_class(css_class.to_s.tr("_", "-"))
      end
    end

    def remove_outer_box
      element = @body.at_css('path[d="M0 0h24v24H0z"]')
      element.remove
    end

    def get_icon(icon)
      File.read(File.join(TablerIcons.root, 'src/icons', "#{icon}.svg"))
    end
  end
end