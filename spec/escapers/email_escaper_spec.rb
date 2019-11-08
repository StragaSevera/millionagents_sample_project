# frozen_string_literal: true

require 'rspec'
require 'escapers/email_escaper'

describe Escapers::EmailEscaper do
  context 'when given correct email' do
    it 'escapes first part' do
      escaper = Escapers::EmailEscaper.new
      expect(escaper.escape('test@yandex.ru')).to eq 'xxxx@yandex.ru'
    end

    it 'can set the escape character' do
      escaper = Escapers::EmailEscaper.new(char: '_')
      expect(escaper.escape('another@gmail.com')).to eq '_______@gmail.com'
    end
  end

  context 'when given incorrect email' do
    it 'raises an error when no @' do
      escaper = Escapers::EmailEscaper.new
      expect { escaper.escape('test') }.to raise_error(ArgumentError)
    end

    it 'raises an error when two @' do
      escaper = Escapers::EmailEscaper.new
      expect { escaper.escape('test@yandex@ru') }.to raise_error(ArgumentError)
    end
  end
end
