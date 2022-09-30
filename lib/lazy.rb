# frozen_string_literal: true

require 'optparse'

require_relative './constants'
require_relative './analyze'

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
    analyze_map(command_map, commands_to_print: options[:num])
  else
    analyze_map(command_map)
  end
end

run
