module Spty::Command
  class HelpCommand
    HELP_TEXT =
      "usage: spty <command> [<args>]\n"\
      "\n"\
      "Player specific command\n"\
      "  state             Display the current player state\n"\
      "  play              Play the current track\n"\
      "  pause             Pause the current track\n"\
      "  toggle            Toggle player play or pause\n"\
      "  skip              Skip the current track and play the next track\n"\
      "  replay            Replay the current track\n"\
      "  volume            Shows the current volume level\n"\
      "  volume up         Increase the volume level by 10\n"\
      "  volume down       Decrease the volume level by 11\n"\
      "  volume [number]   Set the volume level to number\n"\
      "  mute              Set the volume level to 0\n"\
      "  unmute            Set the volume level to 60\n"\
      "\n"\
      "Track specific command\n"\
      "  info              Show information for the current track\n"\
      "\n"\
      "Version: #{Spty::VERSION}"

    def self.call(_command, _)
      puts HELP_TEXT
    end
  end
end
