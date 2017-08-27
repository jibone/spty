module Spty::Command
  class StateCommand
    # Display the current state of the player.
    ASCRIPT_PLAYER_STATE = <<-EOL
      tell application "Spotify" to return player state
    EOL
    def self.call(_, _command = nil)
      if Spty::Command::PlayerCommand.running?
        player_state = Spty::AppleScriptRunner.(ASCRIPT_PLAYER_STATE)
        puts "=> player #{player_state}"
      end
    end
  end
end
