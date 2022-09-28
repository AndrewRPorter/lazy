# frozen_string_literal: true

require 'optparse'

require_relative './lib/parser/history_parser'
require_relative './lib/exceptions'
require_relative './lib/constants'

def history_file
  case ENV['SHELL']
  when ZSH_SHELL_PATH
    File.expand_path(ZSH_HISTORY_FILE_PATH)
  when BASH_SHELL_PATH
    File.expand_path(BASH_HISTORY_FILE_PATH)
  else
    raise UnknownShell
  end
end

# read history of shell commands from the history file path.
def read_commands
  commands = []
  parser = HistoryParser.new

  File.open(history_file, 'r') do |f|
    f.each_line do |line|
      commands.push(parser.parse_command(line))
    end
  end

  commands
end

# create a mapping of command => count from the list of
# all commands in our history file.
def create_mapping
  commands = read_commands
  Hash.new(0).tap { |h| commands.each { |command| h[command] += 1 } }
end

# analyze our map to find the most frequent shell commands
def analayze_map(command_map, commands_to_print: NUM_COMMANDS_TO_PRINT)
  sorted_map = command_map.sort_by { |_, count| count }
  # print the top N commands
  reversed_sorted_map = sorted_map.reverse[0...commands_to_print]
  reversed_sorted_map.each { |command, count| puts "#{command}: #{count}" }
end

def parse_arguments
  options = {}
  OptionParser.new do |opts|
    opts.banner = 'Usage: main.rb [options]'

    opts.on('-n', '--num num', Integer, 'Number of commands to print') do |num|
      options[:num] = num
    end
  end.parse!(ARGV)
  options
end

def run
  options = parse_arguments
  command_map = create_mapping

  if options[:num]
    analayze_map(command_map, commands_to_print: options[:num])
  else
    analayze_map(command_map)
  end
  
end

run
