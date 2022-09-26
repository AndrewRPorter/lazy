# frozen_string_literal: true

require_relative '../src/parser'

describe Parser do
  let(:parser) { Parser.new }

  it 'parses history line item with one command' do
    expect(parser.parse_command(': 1650408552:0;git status')).to eq('git status')
  end

  it 'parses history line item with two commands' do
    expect(parser.parse_command(': 1650408552:0;git status; git clear')).to eq('git status; git clear')
  end
end
