module Spty::Command
  class ToggleCommand
    # Toggle player play / pause
    ASCRIPT_PLAYER_TOGGLE = <<-EOL
      tell application "Spotify" to playpause
    EOL
    def self.call(_, command = 'toggle')
      puts '------------->jhk'
      if Spty::Command::PlayerCommand.running?
        Spty::AppleScriptRunner.(ASCRIPT_PLAYER_TOGGLE)
        Spty::Command::StateCommand.(nil, command)
      end
    end
  end
end
