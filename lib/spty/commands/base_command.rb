module Spty::Command
  class BaseCommand
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
  end
end
