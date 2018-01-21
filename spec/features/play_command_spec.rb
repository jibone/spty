require 'spec_helper'

RSpec.describe 'command: spty play' do
  context 'when player is running' do
    context 'and player state is paused' do
      it 'plays the icurrent track' do
        mock_player_running(true)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::StateCommand::ASCRIPT_PLAYER_STATE)
          .and_return('paused')

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::PlayCommand::ASCRIPT_PLAYER_PLAY)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::InfoCommand::ASCRIPT_TRACK_INFO)
          .and_return('Bohemian Rhapsody - Queen')


        run_command 'spty play'

        output = '=> Bohemian Rhapsody - Queen [playing]'
        expect($stdout.string).to include(output)
      end
    end

    context 'and player state is playing' do
      it 'shows the current track info' do
        mock_player_running(true)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::StateCommand::ASCRIPT_PLAYER_STATE)
          .and_return('playing')

        expect(Spty::AppleScriptRunner).to_not receive(:call)
          .with(Spty::Command::PlayCommand::ASCRIPT_PLAYER_PLAY)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::InfoCommand::ASCRIPT_TRACK_INFO)
          .and_return('Bohemian Rhapsody - Queen')

        run_command 'spty play'

        output = '=> Bohemian Rhapsody - Queen [playing]'
        expect($stdout.string).to include(output)
      end
    end
  end

  it_behaves_like 'application not launched', 'spty play'
end
