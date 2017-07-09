module Spty
  class Cli
    def self.call(args)
      command = args.shift

      begin
        klass = Object.const_get("Spty::Command::#{command.capitalize}Command")
        klass.(args)
      rescue NameError => _e
        puts "Do not understand command: #{command}"
        # [todo] display help menu with list of all valid commands
      end
    end
  end
end
