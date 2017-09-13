module Spty::Command
  class ToggleCommand < BaseCommand
    # Toggle player play / pause
    ASCRIPT_PLAYER_TOGGLE = <<-EOL
      tell application "Spotify" to playpause
    EOL
    def self.call(_, command = 'toggle')
      return unless running?

      Spty::AppleScriptRunner.(ASCRIPT_PLAYER_TOGGLE)
      Spty::Command::StateCommand.(nil, command)
    end
  end
end
