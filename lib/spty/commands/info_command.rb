module Spty::Command
  class InfoCommand
    ASCRIPT_TRACK_INFO = <<-EOL
      tell application "Spotify"
        set currentTrack to name of current track as string
        set currentArtist to artist of current track as string

        return currentTrack & " - " & currentArtist
      end tell
    EOL
    def self.call(_, _command = 'info')
      if Spty::Command::PlayerCommand.running?
        track_info = Spty::AppleScriptRunner.(ASCRIPT_TRACK_INFO)
        player_state_script = Spty::Command::StateCommand::ASCRIPT_PLAYER_STATE
        player_state = Spty::AppleScriptRunner.(player_state_script)

        puts "=> #{track_info.strip} [#{player_state.strip}]"
      end
    end
  end
end
