# frozen_string_literal: true

require 'bundler/setup'

require_relative '../config/boot'

RSpec.configure do |config|
  $LOAD_PATH.unshift(File.expand_path('../lib', __dir__))
  $LOAD_PATH.unshift(File.expand_path('../app', __dir__))

  config.before(:each) do
    AccountStore.instance.all.clear
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:each) do
    allow(LogWriter).to receive(:new).and_return(
      double('LogWriter', record: nil, save: nil, close: nil)
    )
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
