# frozen_string_literal: true

class BaseService
  def self.call(*args)
    new(*args).send(:call)
  end

  private

  def call
    raise NotImplementedError
  end
end
