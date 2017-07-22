require 'open3'

module Spty
  class AppleScriptRunner
    def self.call(script)
      stdout, stderr, _status = Open3.capture3('osascript', stdin_data: script)
      (stderr == '') ? stdout : stderr
    end
  end
end
