# frozen_string_literal: true

require_relative "rspec_pacman/version"
require 'rspec/core/formatters/base_text_formatter'

module RspecPacman
  class PacmanFormatter < RSpec::Core::Formatters::BaseTextFormatter
    RSpec::Core::Formatters.register self, :example_passed, :example_failed, :example_pending, :dump_summary


    def example_passed(notification)
      output.print RSpec::Core::Formatters::ConsoleCodes.wrap('.', :success)
    end

    def example_failed(notification)
      output.print RSpec::Core::Formatters::ConsoleCodes.wrap('F', :failure)
    end

    def example_pending(notification)
      output.print RSpec::Core::Formatters::ConsoleCodes.wrap('*', :pending)
    end


    def dump_summary(summary)
      output.puts "\n"
      output.puts "テスト結果："
      output.puts "✅ 成功: #{summary.example_count - summary.failure_count - summary.pending_count}"
      output.puts "❌ 失敗: #{summary.failure_count}"
      output.puts "⏸️ 保留: #{summary.pending_count}"
      output.puts "実行時間: #{summary.duration.round(2)}秒"
    end
  end
end
