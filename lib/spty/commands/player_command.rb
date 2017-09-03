module Spty::Command
  class PlayerCommand < BaseCommand
    # Check if the application is running
    ASCRIPT_PLAYER_DETECT = <<-EOL
      if application "Spotify" is running then
        return "Running"
      else
        return "Not running"
      end if
    EOL
    def self.running?(show_mesg: true)
      player_running = Spty::AppleScriptRunner.(ASCRIPT_PLAYER_DETECT)
      return true if player_running.strip == 'Running'

      if show_mesg
        output = "player not running\n"\
                 "to launch Spotify player, use: spty launch"

        puts output
      end

      false
    end

    # Method is depreciated. It calls the actuall method
    # This method should be removed on next release
    def self.state(_, command = 'state')
      if running?
        Spty::Command::StateCommand.('state')
        puts "Command is deprecated. Use \"spty #{command}\"."
      end
    end

    # Method is depreciated. It calls the actuall method
    # This method should be removed on next release
    def self.toggle(_, command = 'toggle')
      if running?
        Spty::Command::ToggleCommand.(nil, 'toggle')
        puts "Command is deprecated. Use \"spty #{command}\"."
      end
    end
  end
end
