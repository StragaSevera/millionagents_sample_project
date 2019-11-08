# frozen_string_literal: true

require 'rspec'
require 'escapers/phone_escaper'

describe Escapers::PhoneEscaper do
  context 'when given correct phone' do
    it 'escapes last 3 digits' do
      escaper = Escapers::PhoneEscaper.new
      expect(escaper.escape('+7 666 777 888')).to eq '+7 666 777 xxx'
    end

    it 'can set the escape character' do
      escaper = Escapers::PhoneEscaper.new(char: '*')
      expect(escaper.escape('+7 666 777 888')).to eq '+7 666 777 ***'
    end

    it 'can set the escape count' do
      escaper = Escapers::PhoneEscaper.new(count: 5)
      expect(escaper.escape('+7 666 777 888')).to eq '+7 666 7xx xxx'
    end

    it 'can set all options' do
      escaper = Escapers::PhoneEscaper.new(count: 4, char: '&')
      expect(escaper.escape('+7 666 777 888')).to eq '+7 666 77& &&&'
    end

    it 'truncates space sequences' do
      escaper = Escapers::PhoneEscaper.new
      expect(escaper.escape('+7 666  777888')).to eq '+7 666 777xxx'
    end
  end

  context 'when given incorrect phone' do
    it 'raises error when there are not enough digits in phone' do
      escaper = Escapers::PhoneEscaper.new
      expect { escaper.escape('+7 9') }.to raise_error(ArgumentError)
    end
  end
end
