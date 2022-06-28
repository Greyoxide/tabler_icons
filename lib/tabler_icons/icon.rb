module TablerIcons

  require 'nokogiri'

  class Icon
    def initialize(icon, height=24, width=24, stroke_width=2, color='currentColor', classes)
      source = get_icon icon
      element = source.css('svg')

      element.set('height', height)
      element.set('width', width)
      element.set('stroke-width', stroke_width)
      element.set('stroke', color)
    end

    def get_icon
      begin
        source = File.read("../../icons/#{icon}", "rb")
        Nokogiri::XML.parse source
      rescue Errno::ENOENT
        return "#{icon} doesn't exist"
      end
    end
  end
end