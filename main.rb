# frozen_string_literal: true

require 'optparse'

require_relative './lib/parser/history_parser_factory'
require_relative './lib/constants'

# create a mapping of command => count from the list of
# all commands in our history file.
def create_mapping
  parser = HistoryParserFactory.create
  commands = parser.commands
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
