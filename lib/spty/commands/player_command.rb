module Spty::Command
  class PlayerCommand
    def self.call(options)
      action = options.shift

      begin
        self.send(action.to_sym, options)
      rescue NameError => _e
        puts "Do not understand command: player #{action}"
      end
    end

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

    # Display the current state of the player.
    ASCRIPT_PLAYER_STATE = <<-EOL
      tell application "Spotify" to return player state
    EOL
    def self.state(_)
      if running?
        player_state = Spty::AppleScriptRunner.(ASCRIPT_PLAYER_STATE)
        puts "=> player #{player_state}"
      end
    end

    # Toggle player play / pause
    ASCRIPT_PLAYER_TOGGLE = <<-EOL
      tell application "Spotify" to playpause
    EOL
    def self.toggle(_)
      if running?
        Spty::AppleScriptRunner.(ASCRIPT_PLAYER_TOGGLE)
        state(nil)
      end
    end
  end
end
