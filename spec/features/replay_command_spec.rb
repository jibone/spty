require 'spec_helper'

RSpec.describe 'Replay previous track' do
  context 'spty replay' do
    context 'when application is running' do
      it 'runs AppleScript previous command to replay the previous track' do
        allow(Spty::Command::PlayerCommand).to receive(:running?)
          .and_return(true)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::ReplayCommand::ASCRIPT_TRACK_REPLAY)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::InfoCommand::ASCRIPT_TRACK_INFO)
          .and_return('Bohemian Rhapsody - Queen')

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::StateCommand::ASCRIPT_PLAYER_STATE)
          .and_return('paused')

        run_command 'spty replay'

        output = '=> Bohemian Rhapsody - Queen [paused]'
        expect($stdout.string).to include(output)
      end
    end

    it_behaves_like 'application not launched', 'spty replay'
  end
end
