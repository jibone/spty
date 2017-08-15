require 'spec_helper'

RSpec.describe 'Replay previous track' do
  context 'spty track replay' do
    context 'when application is running' do
      it 'runs AppleScript previous command to replay the previous track' do
        allow(Spty::Command::PlayerCommand).to receive(:running?)
          .and_return(true)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::TrackCommand::ASCRIPT_TRACK_REPLAY)

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::TrackCommand::ASCRIPT_TRACK_INFO)
          .and_return('Bohemian Rhapsody - Queen')

        expect(Spty::AppleScriptRunner).to receive(:call)
          .with(Spty::Command::PlayerCommand::ASCRIPT_PLAYER_STATE)
          .and_return('paused')

        run_command 'spty track replay'

        output = '=> Bohemian Rhapsody - Queen [paused]'
        expect($stdout.string).to include(output)

        deprecation_message = 'Command is deprecated. Use "spty replay".'
        expect($stdout.string).to include(deprecation_message)
      end
    end

    it_behaves_like 'application not launched', 'spty track replay'
  end
end
