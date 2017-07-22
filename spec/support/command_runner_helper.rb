module CommandRunnerHelper
  def run_command(args)
    args_array = args.split

    raise 'Wrong command set' if args_array.first != 'spty'

    args_array.shift
    Spty::Cli.(args_array)
  end
end
