require 'spec_helper'

RSpec.describe 'command: spty volume' do
  context 'with sub command: spty volume up' do
    it 'increases the volume by 10' do
      allow(Spty::Command::PlayerCommand).to receive(:running?)
        .and_return(true)

      expect(Spty::AppleScriptRunner).to receive(:call)
        .with(Spty::Command::VolumeCommand::ASCRIPT_PLAYER_VOLUME_UP)

      expect(Spty::AppleScriptRunner).to receive(:call)
        .with(Spty::Command::VolumeCommand::ASCRIPT_PLAYER_VOLUME_STATUS)
       .and_return(30)

      run_command 'spty volume up'

      output = 'volume is at 30'
      expect($stdout.string).to include(output)
    end

    it_behaves_like 'application not launched', 'spty volume up'
  end

  context 'with sub command: spty volume down' do
    it 'decreases the volume by 10' do
      allow(Spty::Command::PlayerCommand).to receive(:running?)
        .and_return(true)

      expect(Spty::AppleScriptRunner).to receive(:call)
        .with(Spty::Command::VolumeCommand::ASCRIPT_PLAYER_VOLUME_DOWN)

      expect(Spty::AppleScriptRunner).to receive(:call)
        .with(Spty::Command::VolumeCommand::ASCRIPT_PLAYER_VOLUME_STATUS)
       .and_return(30)

      run_command 'spty volume down'

      output = 'volume is at 30'
      expect($stdout.string).to include(output)
    end

    it_behaves_like 'application not launched', 'spty volume down'
  end

  context 'with sub command: spty volume [number]' do
    context 'and [number] is within the range (0 - 100)' do
      it 'set the volume with the given number' do
        allow(Spty::Command::PlayerCommand).to receive(:running?)
          .and_return(true)

        script = format(
          Spty::Command::VolumeCommand::ASCRIPT_PLAYER_VOLUME_SET,
          level: '29'
        )

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(script)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::VolumeCommand::ASCRIPT_PLAYER_VOLUME_STATUS)
          .and_return(29)

        run_command 'spty volume 29'

        output = 'volume is at 29'
        expect($stdout.string).to include(output)
      end

      it_behaves_like 'application not launched', 'spty volume 29'
    end

    context 'and [number] is not within the range (0 - 100)' do
      it 'shows error message and does not run the script' do
        allow(Spty::Command::PlayerCommand).to receive(:running?)
          .and_return(true)

        expect(Spty::AppleScriptRunner).to_not receive(:call)

        run_command 'spty volume 101'

        output = 'volume level should be between 0 to 100'
        expect($stdout.string).to include(output)
      end

      it_behaves_like 'application not launched', 'spty volume 101'
    end
  end

  context 'with sub command: spty volume status' do
    it 'shows the current volume level' do
      allow(Spty::Command::PlayerCommand).to receive(:running?)
        .and_return(true)

      expect(Spty::AppleScriptRunner).to receive(:call)
        .with(Spty::Command::VolumeCommand::ASCRIPT_PLAYER_VOLUME_STATUS)
        .and_return(30)

      run_command 'spty volume status'

      output = 'volume is at 30'
      expect($stdout.string).to include(output)
    end

    it_behaves_like 'application not launched', 'spty volume status'
  end

  context 'with no sub command: spty volume' do
    it 'shows the current volume level' do
      allow(Spty::Command::PlayerCommand).to receive(:running?)
        .and_return(true)

      expect(Spty::AppleScriptRunner).to receive(:call)
        .with(Spty::Command::VolumeCommand::ASCRIPT_PLAYER_VOLUME_STATUS)
        .and_return(30)

      run_command 'spty volume'

      output = 'volume is at 30'
      expect($stdout.string).to include(output)
    end

    it_behaves_like 'application not launched', 'spty volume'
  end

  context 'with invalid sub commandL spty volume xxx' do
    it 'shows error message' do
      allow(Spty::Command::PlayerCommand).to receive(:running?)
        .and_return(true)

      run_command 'spty volume xxx'

      output = 'unknown volume command xxx'
      expect($stdout.string).to include(output)
    end
  end
end
