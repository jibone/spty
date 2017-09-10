module Spty::Command
  class HelpCommand

    HELP_TEXT =
      "usage: spty <command> [<args>]\n"\
      "\n"\
      "Player specific command\n"\
      "  state             Display teh current player state\n"\
      "  toggle            Toggle player play or pause\n"\
      "  skip              Skip the current track and play the next track\n"\
      "  replay            Replay the current track\n"\
      "  volume            Shows the current volume level"\
      "  volume up         Increase the volume level by 10"\
      "  volume down       Decrease the volume level by 11"\
      "  volume [number]   Set the volume level to number"
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
