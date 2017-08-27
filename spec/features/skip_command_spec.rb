require 'spec_helper'

RSpec.describe 'Skip track and play the next track' do
  context 'spty track skip' do
    context 'when application is running' do
      it 'runs AppleScript skip to the next track' do
        allow(Spty::Command::PlayerCommand).to receive(:running?)
          .and_return(true)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::SkipCommand::ASCRIPT_TRACK_SKIP)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::InfoCommand::ASCRIPT_TRACK_INFO)
          .and_return('Bohemian Rhapsody - Queen')

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::StateCommand::ASCRIPT_PLAYER_STATE)
          .and_return('paused')

        run_command 'spty skip'

        output = '=> Bohemian Rhapsody - Queen [paused]'
        expect($stdout.string).to include(output)
      end
    end

    it_behaves_like 'application not launched', 'spty skip'
  end
end
