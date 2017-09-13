module Spty::Command
  class ReplayCommand < BaseCommand

    ASCRIPT_TRACK_REPLAY = <<-EOL
      tell application "Spotify"
        previous track
      end tell
    EOL
    def self.call(_, command = 'replay')
      return unless running?

      Spty::AppleScriptRunner.(ASCRIPT_TRACK_REPLAY)
      Spty::Command::InfoCommand.(nil, command)
    end

  end
end
