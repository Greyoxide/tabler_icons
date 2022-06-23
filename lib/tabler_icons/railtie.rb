require 'rails'

module TablerIconsHelper
  class Railtie < Rails::Railtie
    initializer 'tabler_icons.helper' do
      ActionView::Base.send :include, TablerIconsHelper
    end
  end
end