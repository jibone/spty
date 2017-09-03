RSpec.shared_examples 'application not launched' do |command_string|
  context 'when application is not launched' do
    it 'shows error with message' do
      allow(Spty::AppleScriptRunner).to receive(:call)
        .with(Spty::Command::PlayerCommand::ASCRIPT_PLAYER_DETECT)
        .and_return('Not running')

      run_command command_string

      output = "player not running\n"\
               "to launch Spotify player, use: spty launch\n"

      expect($stdout.string).to include(output)
    end
  end
end
