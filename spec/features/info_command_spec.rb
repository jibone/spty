
require 'spec_helper'

RSpec.describe 'get track name and artist' do
  context 'spty info' do
    context 'when application is running' do
      it 'shows the current application state and the track running' do
        allow(Spty::Command::PlayerCommand).to receive(:running?)
          .and_return(true)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::StateCommand::ASCRIPT_PLAYER_STATE)
          .and_return('paused')

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::InfoCommand::ASCRIPT_TRACK_INFO)
          .and_return('Bohemian Rhapsody - Queen')

        run_command 'spty info'

        output = '=> Bohemian Rhapsody - Queen [paused]'
        expect($stdout.string).to include(output)
      end
    end

    it_behaves_like 'application not launched', 'spty info'
  end
end
