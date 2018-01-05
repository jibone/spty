module Spty::Command
  class UnmuteCommand < BaseCommand
    ASCRIPT_PLAYER_UNMUTE = <<-EOL
      tell application "Spotify"
        set sound volume to 60
      end tell
    EOL
    def self.call(options, _)
      return unless running?

      Spty::AppleScriptRunner.call(ASCRIPT_PLAYER_UNMUTE)
      puts "Player unmute"
    end
  end
end
