# frozen_string_literal: true

require_relative "rspec_pacman/version"
require 'rspec/core/formatters/base_text_formatter'
require 'io/console'

module RspecPacman
  class PacmanFormatter < RSpec::Core::Formatters::BaseTextFormatter
    RSpec::Core::Formatters.register self, :example_started, :example_passed, :example_failed, :example_pending, :dump_summary, :start

    FULL_WIDTH_SPACE = "　"
    CURRENT_EXECUTION_MARK = "🟡"

    def initialize(output)
      super
      @total_examples = 0
      @completed_examples = 0
      @progress_bar = []
    end

    def start(notification)
      @total_examples = notification.count
      @bar_length = @total_examples
      @progress_bar = Array.new(@total_examples) { RSpec::Core::Formatters::ConsoleCodes.wrap("・", :yellow) }
    end

    def update_progress
      bar = @progress_bar.join

      progress_bar = "total: #{@total_examples} |#{bar}|"
      output.print "\r#{progress_bar.ljust(@bar_length + 20)}"
      output.flush
    end

    def example_started(notification)
      @progress_bar[@completed_examples] = CURRENT_EXECUTION_MARK
      update_progress
    end

    def example_passed(notification)
      @progress_bar[@completed_examples] = FULL_WIDTH_SPACE
      @completed_examples += 1
      update_progress
    end

    def example_failed(notification)
      @progress_bar[@completed_examples] = RSpec::Core::Formatters::ConsoleCodes.wrap("・", :red)
      @completed_examples += 1
      update_progress
    end

    def example_pending(notification)
      @progress_bar[@completed_examples] = RSpec::Core::Formatters::ConsoleCodes.wrap("・", :yellow)
      @completed_examples += 1
      update_progress
    end

    def dump_summary(summary)
      output.puts "\n"
      output.puts "Result"
      output.puts "✅ Success: #{summary.example_count - summary.failure_count - summary.pending_count}"
      output.puts "❌ Failed: #{summary.failure_count}"
      output.puts "⏸️ Pendding: #{summary.pending_count}"
      output.puts "Total Time: #{summary.duration.round(2)}秒"
    end
  end
end
