module Spty::Command
  class TrackCommand < BaseCommand
    ASCRIPT_TRACK_INFO = <<-EOL
      tell application "Spotify"
        set currentTrack to name of current track as string
        set currentArtist to artist of current track as string

        return currentTrack & " - " & currentArtist
      end tell
    EOL
    def self.info(_, command = 'info')
      if Spty::Command::PlayerCommand.running?
        track_info = Spty::AppleScriptRunner.(ASCRIPT_TRACK_INFO)
        player_state_script = Spty::Command::PlayerCommand::ASCRIPT_PLAYER_STATE
        player_state = Spty::AppleScriptRunner.(player_state_script)

        puts "=> #{track_info.strip} [#{player_state.strip}]"
        puts "Command is deprecated. Use \"spty #{command}\"."
      end
    end

    ASCRIPT_TRACK_SKIP = <<-EOL
      tell application "Spotify"
        next track
      end tell
    EOL
    def self.skip(_)
      move_track(ASCRIPT_TRACK_SKIP, 'skip')
    end

    ASCRIPT_TRACK_REPLAY = <<-EOL
      tell application "Spotify"
        previous track
      end tell
    EOL
    def self.replay(_)
      move_track(ASCRIPT_TRACK_REPLAY, 'replay')
    end

    def self.move_track(ascript, command)
      if Spty::Command::PlayerCommand.running?
        Spty::AppleScriptRunner.(ascript)
        Spty::Command::TrackCommand.info(nil, command)
      end
    end

    private_class_method :move_track
  end
end
