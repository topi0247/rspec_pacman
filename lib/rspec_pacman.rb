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
      @terminal_width = IO.console.winsize[1] rescue 80
      @last_printed_lines = 0
    end

    def start(notification)
      @total_examples = notification.count
      @progress_bar = Array.new(@total_examples) { "・" }
      update_progress
    end

    def display_width(str)
      str.each_char.map { |char| char.bytesize == 1 ? 1 : 2 }.sum
    end

    def update_progress
      completed_bar = @progress_bar[0...@completed_examples].join
      rest_bar = RSpec::Core::Formatters::ConsoleCodes.wrap(@progress_bar[@completed_examples..-1].join, :yellow)
      all_bar = "#{completed_bar}#{rest_bar}"

      prefix = "total: #{@total_examples} |"
      suffix = "|"
      extra_length = display_width(prefix) + display_width(suffix)

      max_bar_length = @terminal_width - extra_length

      lines = []
      current_line = prefix
      all_bar.each_char do |char|
        if display_width(current_line + char + suffix) > @terminal_width
          lines << current_line
          current_line = " " * display_width(prefix)
        end
        current_line += char
      end
      lines << current_line + suffix

      output.print "\e[#{@last_printed_lines}F\e[J" if @last_printed_lines > 0

      lines.each do |line|
        output.puts line
      end

      @last_printed_lines = lines.size
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
      output.puts RSpec::Core::Formatters::ConsoleCodes.wrap("✅ Success: #{summary.example_count - summary.failure_count - summary.pending_count}", :blue)
      output.puts RSpec::Core::Formatters::ConsoleCodes.wrap("❌ Failed: #{summary.failure_count}", :red)
      output.puts RSpec::Core::Formatters::ConsoleCodes.wrap("⏸️ Pending: #{summary.pending_count}", :yellow)
      output.puts "Total Time: #{summary.duration.round(2)}秒"
    end
  end
end
