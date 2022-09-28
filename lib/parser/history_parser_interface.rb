# frozen_string_literal: true

# Interface for the history parsers.
class HistoryParserInterface
  def parse_command
    raise 'Not implemented'
  end

  def commands
    raise 'Not implemented'
  end

  def history_file
    raise 'Not implemented'
  end
end
