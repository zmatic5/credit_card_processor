# frozen_string_literal: true

require 'zeitwerk'

module Commands; end
module Validators; end

loader = Zeitwerk::Loader.new
loader.push_dir("#{__dir__}/../app/services")
loader.push_dir("#{__dir__}/../app/services/commands", namespace: Commands)
loader.push_dir("#{__dir__}/../app/services/validators", namespace: Validators)
loader.push_dir("#{__dir__}/../app/models")
loader.push_dir("#{__dir__}/../app/stores")
loader.setup
