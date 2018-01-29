module Spty::Command
  class MuteCommand < BaseCommand
    ASCRIPT_PLAYER_MUTE = <<-EOL
      tell application "Spotify"
        set sound volume to 0
      end tell
    EOL
    def self.call(options, _)
      return unless running?

      Spty::AppleScriptRunner.call(ASCRIPT_PLAYER_MUTE)
      puts "Player muted"
    end
  end
end
