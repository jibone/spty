require 'spec_helper'

RSpec.describe 'invalid player command' do
  context 'spty player xxx' do
    it 'shows error message' do
      run_command 'spty player xxx'

      expect($stdout.string).to include('Do not understand command: player xxx')
    end
  end
end
