module Spty::Command
  class TrackCommand < BaseCommand

    # This command is deprecated.
    def self.info(_, command = 'info')
      if Spty::Command::PlayerCommand.running?
        Spty::Command::InfoCommand.(nil, 'info')
        puts "Command is deprecated. Use \"spty #{command}\"."
      end
    end

    # This command is deprecated.
    def self.skip(_)
      Spty::Command::SkipCommand.call(nil)
      puts 'Command is deprecated. Use "spty skip".'
    end

    # This command is deprecared.
    def self.replay(_)
      #move_track(ASCRIPT_TRACK_REPLAY, 'replay')
      Spty::Command::ReplayCommand.call(nil)
      puts 'Command is deprecated. Use "spty replay".'
    end

  end
end
