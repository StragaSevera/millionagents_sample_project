# frozen_string_literal: true

require 'rspec'
require 'escapers/skype_escaper'

describe Escapers::SkypeEscaper do
  context 'when given correct skype' do
    it 'escapes simple string' do
      escaper = Escapers::SkypeEscaper.new
      expect(escaper.escape('skype:alex.max')).to eq 'skype:xxx'
    end

    it 'escapes complex string' do
      escaper = Escapers::SkypeEscaper.new
      expect(escaper.escape('<a href="'\
        'skype:example-user?call">skype</a>'))
        .to eq '<a href="skype:xxx?call">skype</a>'
    end
  end
  context 'when given incorrect skype' do
    it 'raises an error' do
      escaper = Escapers::SkypeEscaper.new
      expect { escaper.escape('wrong string') }.to raise_error(ArgumentError)
    end
  end
end
