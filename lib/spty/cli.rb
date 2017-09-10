module Spty
  class Cli
    def self.call(args)
      command = args.shift

      begin
        klass = Object.const_get("Spty::Command::#{command.capitalize}Command")
        klass.(args, command)
      rescue NameError => _e
        if !command.nil?
          puts "Do not understand command: #{command}"
        end

        Spty::Command::HelpCommand.(args, command)
      end
    end
  end
end
