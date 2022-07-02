# frozen_string_literal: true

require_relative "tabler_icons/version"
require_relative "tabler_icons/icon"
require_relative "tabler_icons/helper"
require_relative "tabler_icons/railtie"

module TablerIcons
  def self.root
    File.dirname __dir__
  end

  def self.icons_path
    File.join root, 'icons'
  end
end