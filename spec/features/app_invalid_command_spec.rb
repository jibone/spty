require 'spec_helper'

RSpec.describe 'spty with invalid command' do
  context 'spty xxx' do
    it 'shows error message'do
      run_command 'spty xxx'

      expect($stdout.string).to include('Do not understand command: xxx')
    end
  end
end
