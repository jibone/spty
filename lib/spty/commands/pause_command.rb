module Spty::Command
  class PauseCommand < BaseCommand
    ASCRIPT_PLAYER_PAUSE = <<-EOL
      tell application "Spotify"
        pause
      end tell
    EOL
    def self.call(options, _)
      return unless running?

      # Get the player state
      player_state_script = Spty::Command::StateCommand::ASCRIPT_PLAYER_STATE
      player_state = Spty::AppleScriptRunner.(player_state_script)

      if player_state.strip == 'playing'
        Spty::AppleScriptRunner.call(ASCRIPT_PLAYER_PAUSE)
      end

      track_info_script = Spty::Command::InfoCommand::ASCRIPT_TRACK_INFO
      track_info = Spty::AppleScriptRunner.(track_info_script)

      puts "=> #{track_info.strip} [paused]"
    end
  end
end
