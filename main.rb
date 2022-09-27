# frozen_string_literal: true

require_relative './lib/history_parser'
require_relative './lib/exceptions'

# TODO: make this a command line option
NUM_COMMANDS_TO_PRINT = 25

def history_file
  if ENV['SHELL'] == '/bin/zsh'
    File.expand_path('~/.zsh_history')
  elsif ENV['SHELL'] == '/bin/bash'
    File.expand_path('~/.bash_history')
  else
    raise MyCustomException
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
def analayze_map(command_map)
  sorted_map = command_map.sort_by { |_, count| count }
  # print the top N commands
  reversed_sorted_map = sorted_map.reverse[0...NUM_COMMANDS_TO_PRINT]
  reversed_sorted_map.each { |command, count| puts "#{command}: #{count}" }
end

def run
  command_map = create_mapping
  analayze_map(command_map)
end

run
