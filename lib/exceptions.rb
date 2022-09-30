# frozen_string_literal: true

# Error for when trying to determine the calling systems shell but no
# known value is found
class UnknownShell < StandardError
  def initialize(msg = 'An unknown shell has been encountered', exception_type = 'custom')
    @exception_type = exception_type
    super(msg)
  end
end
