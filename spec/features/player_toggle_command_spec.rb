require 'spec_helper'

RSpec.describe 'toggle Spotify player play/pause' do
  context 'spty player toggle' do
    context 'when application is launched' do
      context 'when current player state is playing' do
        it 'runs applescript toggle and return player state as pause' do
          allow(Spty::Command::PlayerCommand).to receive(:running?)
            .and_return(true)

          expect(Spty::AppleScriptRunner).to receive(:call)
            .with(Spty::Command::PlayerCommand::ASCRIPT_PLAYER_TOGGLE)

          expect(Spty::AppleScriptRunner).to receive(:call)
            .with(Spty::Command::StateCommand::ASCRIPT_PLAYER_STATE)
            .and_return('paused')

          run_command 'spty player toggle'

          expect($stdout.string).to include('=> player paused')
          deprecation_message = 'Command is deprecated. Use "spty toggle".'
          expect($stdout.string).to include(deprecation_message)
        end
      end
    end

    it_behaves_like 'application not launched', 'spty player toggle'
  end
end
