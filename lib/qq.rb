require File.expand_path(File.dirname(__FILE__) + '/qq/version')

require File.expand_path(File.dirname(__FILE__) + '/qq/config')
require File.expand_path(File.dirname(__FILE__) + '/qq/oauth')
require File.expand_path(File.dirname(__FILE__) + '/qq/client')

if defined?(Rails)
  require File.expand_path(File.dirname(__FILE__) + '/qq/railtie')
end

