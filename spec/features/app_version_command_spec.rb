require 'spec_helper'

RSpec.describe 'get spty version' do
  context 'spty version' do
    it 'shows the correct version' do
      run_command 'spty version'

      expect($stdout.string).to include(Spty::VERSION)
    end
  end
end
