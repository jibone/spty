module Spty::Command
  class VersionCommand
    def self.call(options)
      puts "Version: #{Spty::VERSION}"
    end
  end
end
