module Spty::Command
  class VersionCommand
    def self.call(_, _)
      puts "Version: #{Spty::VERSION}"
    end
  end
end
