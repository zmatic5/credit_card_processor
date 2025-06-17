# frozen_string_literal: true

module Commands
  class ProcessorService
    COMMANDS = {
      'Add' => Commands::AddCardCommand,
      'Charge' => Commands::ChargeCardCommand,
      'Credit' => Commands::CreditCardCommand
    }.freeze

    def self.call(input_lines)
      new(input_lines).call
    end

    def initialize(input_lines)
      @input_lines = input_lines
      @logger = LogWriter.new
    end

    def call
      input_lines.each do |line|
        next if line.strip.empty?

        process_line(line.strip)
      rescue StandardError
        logger.record(line.strip, success: false)
      end

      logger.close
      print_summary
    end

    private

    attr_reader :input_lines, :logger

    def process_line(line)
      command, *args = line.strip.split
      klass = COMMANDS[command]

      unless klass
        logger.record(line, success: false)
        return
      end

      success = klass.call(*args)
      logger.record(line, success: success)
    end

    def print_summary
      AccountStore.instance.keys.sort.each do |name|
        account = AccountStore.instance[name]
        puts "#{name}: #{account.valid? ? "$#{account.balance}" : 'error'}"
      end
    end
  end
end
