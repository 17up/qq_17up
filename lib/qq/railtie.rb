# -*- encoding : utf-8 -*-
module Qq
  class Railtie < ::Rails::Railtie
    initializer "加载rails环境下的config" do
      Qq::Config.load_config
    end
  end
end
