require 'spec_helper'

RSpec.describe 'Launch spotify player' do
  context 'spty launch' do
    context 'when application is not running' do
      it 'launch the application' do
        allow(Spty::Command::PlayerCommand).to receive(:running?)
          .and_return(false)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::LaunchCommand::ASCRIPT_PLAYER_LAUNCH)
          .and_return('launching Spotify player')

        run_command 'spty launch'

        expect($stdout.string).to include('launching Spotify player')
      end
    end

    context 'when application is running' do
      it 'does not launch the application' do
        allow(Spty::Command::PlayerCommand).to receive(:running?)
          .and_return(true)

        expect(Spty::AppleScriptRunner).to_not receive(:call)
          .with(Spty::Command::LaunchCommand::ASCRIPT_PLAYER_LAUNCH)

        run_command 'spty launch'

        expect($stdout.string).to include('Spotify player is running')
      end
    end
  end
end
