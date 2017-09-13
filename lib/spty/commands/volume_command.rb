module Spty::Command
  class VolumeCommand < BaseCommand
    def self.call(options, _)
      return unless running?

      action = options.shift

      # call status if no sub command was called.
      action = 'status' if action.nil?

      # if sub command is number, trigger volume set with the number.
      if action =~ /\A\d+\z/
        options = action.to_i
        action = 'level'
      end

      begin
        send(action.to_sym, options)
      rescue NameError => _e
        puts "unknown volume command #{action}"
      end
    end

    ASCRIPT_PLAYER_VOLUME_STATUS = <<-EOL
      tell application "Spotify" to return sound volume
    EOL
    def self.status(_options = nil)
      current_vol = Spty::AppleScriptRunner.call(ASCRIPT_PLAYER_VOLUME_STATUS)
      puts "volume is at #{current_vol}"
    end

    ASCRIPT_PLAYER_VOLUME_UP = <<-EOL
      tell application "Spotify"
        set currentvol to get sound volume
        if currentvol > 90 then
          set sound volume to 100
        else
          set sound volume to currentvol + 10
        end if
      end tell
    EOL
    def self.up(_options)
      Spty::AppleScriptRunner.call(ASCRIPT_PLAYER_VOLUME_UP)
      status
    end

    ASCRIPT_PLAYER_VOLUME_DOWN = <<-EOL
      tell application "Spotify"
        set currentvol to get sound volume
        if currentvol < 10 then
          set sound volume to 0
        else
          set sound volume to currentvol - 10
        end if
      end tell
    EOL
    def self.down(_options)
      Spty::AppleScriptRunner.call(ASCRIPT_PLAYER_VOLUME_DOWN)
      status
    end

    ASCRIPT_PLAYER_VOLUME_SET = <<-EOL
      tell application "Spotify" to set sound volume to %<level>s
    EOL
    def self.level(options)
      if options < 0 || options > 100
        puts 'volume level should be between 0 to 100'
        return
      end

      script = format(ASCRIPT_PLAYER_VOLUME_SET, level: options)
      Spty::AppleScriptRunner.call(script)
      status
    end
  end
end
