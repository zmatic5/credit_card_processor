# frozen_string_literal: true

require 'singleton'

class AccountStore
  include Singleton

  def initialize
    @accounts = {}
  end

  def all
    @accounts
  end

  def [](name)
    @accounts[name]
  end

  def []=(name, account)
    @accounts[name] = account
  end

  def keys
    @accounts.keys
  end

  def values
    @accounts.values
  end
end
