module Spty::Command
  class TrackCommand
    def self.call(options)
      action = options.shift

      begin
        self.send(action.to_sym, options)
      rescue NameError => _e
        puts "Do not understand command: track #{action}"
      end
    end

    ASCRIPT_TRACK_INFO = <<-EOL
      tell application "Spotify"
        set currentTrack to name of current track as string
        set currentArtist to artist of current track as string

        return currentTrack & " - " & currentArtist
      end tell
    EOL
    def self.info(_)
      if Spty::Command::PlayerCommand.running?
        track_info = Spty::AppleScriptRunner.(ASCRIPT_TRACK_INFO)
        player_state_script = Spty::Command::PlayerCommand::ASCRIPT_PLAYER_STATE
        player_state = Spty::AppleScriptRunner.(player_state_script)

        puts "=> #{track_info.strip} [#{player_state.strip}]"
      end
    end

    ASCRIPT_TRACK_SKIP = <<-EOL
      tell application "Spotify"
        next track
      end tell
    EOL
    def self.skip(_)
      if Spty::Command::PlayerCommand.running?
        Spty::AppleScriptRunner.(ASCRIPT_TRACK_SKIP)
        Spty::Command::TrackCommand.info(nil)
      end
    end

    ASCRIPT_TRACK_REPLAY = <<-EOL
      tell application "Spotify"
        previous track
      end tell
    EOL
    def self.replay(_)
      if Spty::Command::PlayerCommand.running?
        Spty::AppleScriptRunner.(ASCRIPT_TRACK_REPLAY)
        Spty::Command::TrackCommand.info(nil)
      end
    end
  end
end
