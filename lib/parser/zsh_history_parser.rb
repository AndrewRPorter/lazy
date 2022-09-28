# frozen_string_literal: true

require_relative './history_parser_interface'

# Parse the ZSH history file
class ZshHistoryParser < HistoryParserInterface
  def parse_command(history_line_entry)
    # get everything on the left hand side of the ';'
    # and join the content. We want to join the content
    # in the case that the command itself has a ';' e.g.
    # : 1650408552:0;git status; git clear
    split_history = history_line_entry.split(';')
    command_part = split_history.drop(1)
    command_part.join(';').strip
  end

  def commands
    commands = []
    File.open(history_file, 'r') do |f|
      f.each_line do |line|
        commands.push(parse_command(line))
      end
    end
    commands
  end

  def history_file
    File.expand_path(ZSH_HISTORY_FILE_PATH)
  end
end
