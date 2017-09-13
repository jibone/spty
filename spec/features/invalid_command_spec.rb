require 'spec_helper'

RSpec.describe 'invalid player command' do
  context 'spty player xxx' do
    it 'shows error message' do
      run_command 'spty xxx'

      expect($stdout.string).to include('Do not understand command: xxx')
    end
  end
end
