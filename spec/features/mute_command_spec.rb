require 'spec_helper'

RSpec.describe 'command: spty mute' do
  context 'when player is running' do
    it 'sets volume to 0' do
      mock_player_running(true)

      expect(Spty::AppleScriptRunner).to receive(:call)
        .with(Spty::Command::MuteCommand::ASCRIPT_PLAYER_MUTE)

      run_command 'spty mute'

      output = 'Player mute'
      expect($stdout.string).to include(output)
    end
  end

  it_behaves_like 'application not launched', 'spty mute'
end
