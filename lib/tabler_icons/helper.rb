# require 'actions'
require 'action_view'

module TablerIconsHelper

  def tabler_icon(symbol, options = {})
    raw TablerIcons::Icon.new( symbol, options ).body.to_xhtml
  end

  def wrapped_tabler_icon(symbol, class_name, options = {})
    content_tag :div, class: class_name do
      raw TablerIcons::Icon.new( symbol, options ).body.to_xhtml
    end
  end

end

