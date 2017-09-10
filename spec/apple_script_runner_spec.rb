require 'spec_helper'

RSpec.describe 'AppleScriptRunner' do
  context 'when there is an error running apple script' do
    it 'shows error message' do
      allow(Open3).to receive(:capture3)
        .with('osascript', stdin_data: 'script')
        .and_return([nil, 'error', nil])

      expect(Spty::AppleScriptRunner.('script')).to eq('error')
    end
  end

  context 'When there is no error running the apple script' do
    it 'shows stdout message' do
      allow(Open3).to receive(:capture3)
        .with('osascript', stdin_data: 'script')
        .and_return(['output', '', nil])

      expect(Spty::AppleScriptRunner.('script')).to eq('output')
    end
  end
end
