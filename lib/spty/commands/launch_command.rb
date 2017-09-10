module Spty::Command
  class LaunchCommand
    ASCRIPT_PLAYER_LAUNCH = <<-EOL
      tell application "Spotify" to activate
    EOL

    def self.call(_, _command = 'launch')
      if Spty::Command::PlayerCommand.running?(show_mesg: false)
        puts 'Spotify player is running'
        return
      end

      Spty::AppleScriptRunner.(ASCRIPT_PLAYER_LAUNCH)
      puts 'launching Spotify player'
    end
  end
end
