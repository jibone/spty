require 'thor'

module Spty
  class Cli < Thor
    desc 'hello NAME', 'This will greet you'
    long_desc <<-EOF
    This is a long multi line description
    EOF

    option :upcase

    def hello(name)
      greeting = "Hello, #{name}"
      greeting.upcase! if options[:upcase]
      puts greeting
    end
  end
end
