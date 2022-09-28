# frozen_string_literal: true

# Simple parser to handling line items from the systems history
# file.
class HistoryParser
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
end
