module MockHelper
  def mock_player_running(state = true)
    allow(Spty::Command::BaseCommand).to receive(:running?)
      .and_return(state)
  end
end
