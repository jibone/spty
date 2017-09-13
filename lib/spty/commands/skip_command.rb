module Spty::Command
  class SkipCommand < BaseCommand
    ASCRIPT_TRACK_SKIP = <<-EOL
      tell application "Spotify"
        next track
      end tell
    EOL
    def self.call(_, command = 'skip')
      return unless running?

      Spty::AppleScriptRunner.(ASCRIPT_TRACK_SKIP)
      Spty::Command::InfoCommand.(nil, command)
    end

  end
end
