module Spty::Command
  class SkipCommand

    ASCRIPT_TRACK_SKIP = <<-EOL
      tell application "Spotify"
        next track
      end tell
    EOL
    def self.call(_, command = 'skip')
      if Spty::Command::PlayerCommand.running?
        Spty::AppleScriptRunner.(ASCRIPT_TRACK_SKIP)
        Spty::Command::InfoCommand.(nil, command)
      end
    end

  end
end
