module Spty::Command
  class BaseCommand
    def self.call(options, command)
      action = options.shift

      begin
        self.send(action.to_sym, options)
      rescue NameError => _e
        puts "Do not understand command: #{command} #{action}"
      end
    end
  end
end
