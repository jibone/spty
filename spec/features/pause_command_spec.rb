require 'spec_helper'

RSpec.describe 'command: spty pause' do
  context 'when player is running' do
    context 'and player state is paused' do
      it 'shows the current track info' do
        mock_player_running(true)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::StateCommand::ASCRIPT_PLAYER_STATE)
          .and_return('paused')

        expect(Spty::AppleScriptRunner).to_not receive(:call)
          .with(Spty::Command::PauseCommand::ASCRIPT_PLAYER_PAUSE)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::InfoCommand::ASCRIPT_TRACK_INFO)
          .and_return('Bohemian Rhapsody - Queen')


        run_command 'spty pause'

        output = '=> Bohemian Rhapsody - Queen [paused]'
        expect($stdout.string).to include(output)
      end
    end

    context 'and player state is playing' do
      it 'pause the current track' do
        mock_player_running(true)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::StateCommand::ASCRIPT_PLAYER_STATE)
          .and_return('playing')

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::PauseCommand::ASCRIPT_PLAYER_PAUSE)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::InfoCommand::ASCRIPT_TRACK_INFO)
          .and_return('Bohemian Rhapsody - Queen')

        run_command 'spty pause'

        output = '=> Bohemian Rhapsody - Queen [paused]'
        expect($stdout.string).to include(output)
      end
    end
  end

  it_behaves_like 'application not launched', 'spty play'
end
