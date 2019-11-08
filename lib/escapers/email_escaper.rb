# frozen_string_literal: true

require_relative '../escapers'

class Escapers::EmailEscaper
  def initialize(opt = { char: 'x' })
    @escape_char = opt[:char]
  end

  def escape(email)
    # Not using regex because task is simple enough
    email_parts = email.split('@')
    raise ArgumentError if email_parts.length != 2

    email_parts[0] = @escape_char * email_parts[0].length
    email_parts.join('@')
  end
end
