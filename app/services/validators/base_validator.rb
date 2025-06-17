# frozen_string_literal: true

module Validators
  class BaseValidator
    private

    def validate_presence!(value, field_name)
      raise ArgumentError, "Missing #{field_name}" if value.nil? || value.strip.empty?
    end
  end
end
