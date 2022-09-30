# frozen_string_literal: true

require_relative './bash_history_parser'
require_relative './zsh_history_parser'
require_relative '../exceptions'

# Simple parser to handling line items from the systems history
# file.
class HistoryParserFactory
  def self.create(input_shell: ENV['SHELL'])
    case input_shell
    when ZSH_SHELL_PATH
      ZshHistoryParser.new
    when BASH_SHELL_PATH
      BashHistoryParser.new
    else
      raise UnknownShell
    end
  end
end
