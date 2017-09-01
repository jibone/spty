module Spty::Command
  class HelpCommand

    HELP_TEXT =
      "usage: spty <command> [<args>]\n"\
      "\n"\
      "Player specific command\n"\
      "  state        Display teh current player state\n"\
      "  toggle       Toggle player play or pause\n"\
      "  skip         Skip the current track and play the next track\n"\
      "  replay       Replay the current trac\n"\
      "\n"\
      "Track specific command\n"\
      "  info         Show information for the current track\n"\
      "\n"\
      "Version: #{Spty::VERSION}"

    def self.call(command = nil, _)
      puts HELP_TEXT
    end
  end
end
