# frozen_string_literal: true

require_relative '../escapers'

class Escapers::SkypeEscaper
  REGEX = /skype:[a-zA-Z.-]+(?=$|\?)/.freeze
  def escape(skype)
    raise ArgumentError unless REGEX.match? skype

    skype.sub(REGEX, 'skype:xxx')
  end
end
