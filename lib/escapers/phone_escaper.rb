# frozen_string_literal: true

require_relative '../escapers'

class Escapers::PhoneEscaper
  def initialize(opt = {})
    @escape_char = opt[:char] || 'x'
    @escape_count = opt[:count] || 3
  end

  def escape(phone)
    # Unfreezing and truncating spaces
    result = String.new(phone).gsub(/\s+/, ' ')
    matches_left = @escape_count
    # First char is always +, so iterating up to second
    (result.length - 1).downto 1 do |i|
      if /\d/.match? result[i]
        matches_left -= 1
        result[i] = @escape_char
      end
      break if matches_left.zero?
    end
    raise ArgumentError if matches_left.positive?

    result.freeze
  end
end
