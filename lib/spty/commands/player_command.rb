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
    def self.running?
      player_running = Spty::AppleScriptRunner.(ASCRIPT_PLAYER_DETECT)
      return true if player_running.strip == 'Running'

      puts "=> player not running" and return false
    end

    # Method is depreciated. It calls the actuall class
    def self.state(_, command = 'state')
      if running?
        Spty::Command::StateCommand.('state')
        puts "Command is deprecated. Use \"spty #{command}\"."
      end
    end

    # Toggle player play / pause
    ASCRIPT_PLAYER_TOGGLE = <<-EOL
      tell application "Spotify" to playpause
    EOL
    def self.toggle(_)
      if running?
        Spty::AppleScriptRunner.(ASCRIPT_PLAYER_TOGGLE)
        state(nil, 'toggle')
      end
    end
  end
end
