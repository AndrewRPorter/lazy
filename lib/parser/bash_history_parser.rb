# frozen_string_literal: true

require_relative './history_parser_interface'

# Parse the Bash history file
class BashHistoryParser < HistoryParserInterface
  def history_file
    File.expand_path(BASH_HISTORY_FILE_PATH)
  end
end
