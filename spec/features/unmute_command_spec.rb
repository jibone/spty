require 'spec_helper'

RSpec.describe 'command: spty unmute' do
  context 'when player is running' do
    it 'sets volume to 60' do
      mock_player_running(true)

      expect(Spty::AppleScriptRunner).to receive(:call)
        .with(Spty::Command::UnmuteCommand::ASCRIPT_PLAYER_UNMUTE)

      run_command 'spty unmute'

      output = 'Player unmute'
      expect($stdout.string).to include(output)
    end
  end

  it_behaves_like 'application not launched', 'spty toggle'
end
