require 'spec_helper'

RSpec.describe 'List out available commnads and their description' do
  context 'spty help' do
    it 'shows the list of commands and their descriptions' do
      run_command 'spty help'

      expect($stdout.string).to include(Spty::Command::HelpCommand::HELP_TEXT)
    end
  end

  context 'spty xxx' do
    it 'shows the list of commands and their descriptions' do
      run_command 'spty xxx'

      expect($stdout.string).to include(Spty::Command::HelpCommand::HELP_TEXT)
    end
  end

  context 'spty' do
    it 'shows the list of commands and their descriptions' do
      run_command 'spty'

      expect($stdout.string).to include(Spty::Command::HelpCommand::HELP_TEXT)
    end
  end
end
