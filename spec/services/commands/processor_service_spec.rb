# frozen_string_literal: true

require 'spec_helper'
require 'services/commands/processor_service'
require 'models/credit_card_account'

RSpec.describe Commands::ProcessorService do
  let(:input) do
    [
      'Add Tom 4111111111111111 $1000',
      'Add Lisa 5454545454545454 $3000',
      'Add Quincy 1234567890123456 $2000',
      'Charge Tom $500',
      'Charge Tom $800',
      'Charge Lisa $7',
      'Credit Lisa $100',
      'Credit Quincy $200'
    ]
  end

  it 'prints the correct summary' do
    expect do
      described_class.new(input).call
    end.to output("Lisa: $-93\nQuincy: error\nTom: $500\n").to_stdout
  end
end
