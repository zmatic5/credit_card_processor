# frozen_string_literal: true

module Commands
  class BaseCommandService < ::BaseService
    private

    def call
      return false unless validate_input
      return false unless execute

      true
    end

    def validate_input
      raise NotImplementedError
    end

    def execute
      raise NotImplementedError
    end

    def validate_presence!(value, field_name)
      raise ArgumentError, "Missing #{field_name}" if value.nil? || value.strip.empty?
    end
  end
end
