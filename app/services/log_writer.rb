# frozen_string_literal: true

class LogWriter
  def initialize(filepath = 'log.txt')
    @filepath = filepath
    @file = File.open(@filepath, 'w')
  end

  def record(line, success:)
    @file.puts format_line(line, success)
  end

  def close
    @file.close
  end

  private

  def format_line(line, success)
    status = success ? '[OK]   ' : '[ERROR]'
    "#{status} #{line}"
  end
end
