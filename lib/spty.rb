require 'spty/version'
require 'spty/cli'
require 'spty/apple_script_runner'

def require_all(path)
  glob = File.join(File.dirname(__FILE__), path, "*.rb")
  Dir[glob].sort.each do |file|
    require file
  end
end

module Spty
  require_all "spty/commands"
end

