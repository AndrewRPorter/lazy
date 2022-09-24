# frozen_string_literal: true

HISTORY_FILE_PATH = '/Users/andrew/.zsh_history'
NUM_COMMANDS_TO_PRINT = 25

# parse command out of a ZSH history file line entry
def parse_command(history_line_entry)
  # get everything on the left hand side of the ';'
  # and join the content. We want to join the content
  # in the case that the command itself has a ';' e.g.
  # : 1650408552:0;git status; git clear
  split_history = history_line_entry.split(';')
  command_part = split_history.drop(1)
  command_part.join(';').strip
end

# read history of shell commands from the history file path.
def read_commands
  commands = []
  File.open(HISTORY_FILE_PATH, 'r') do |f|
    f.each_line do |line|
      commands.push(parse_command(line))
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
