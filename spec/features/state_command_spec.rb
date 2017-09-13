require 'spec_helper'

RSpec.describe 'get player state' do
  context 'spty state' do
    context 'when application is launched' do
      it 'shows the current application state' do
        mock_player_running(true)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::StateCommand::ASCRIPT_PLAYER_STATE)
          .and_return('paused')

        run_command 'spty state'

        expect($stdout.string).to include('=> player paused')
      end
    end

    it_behaves_like 'application not launched', 'spty state'
  end
end
