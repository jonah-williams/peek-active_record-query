require 'atomic'
require 'thread_safe'
require 'active_record'

module Peek
  module Views
    class ActiveRecordQuery < View
      attr_reader :query_count, :total_duration, :events

      def parse_options
        @query_count = Atomic.new(0)
        @total_duration = Atomic.new(0)
        @events = ThreadSafe::Array.new
      end

      def context
        {
            queries: query_table
        }
      end

      def results
        {
            queries: query_count.value,
            duration: formatted_duration
        }
      end

      private

      def formatted_duration
        ms = total_duration.value
        if ms >= 1000
          "%.2fs" % (ms / 1e3)
        else
          "%.0fms" % ms
        end
      end

      def query_table
        events.map do |event|
          {
              name: event.payload[:name],
              duration: event.duration,
              sql: event.payload[:sql]
          }
        end.freeze
      end

      def setup_subscribers
        before_request do
          query_count.value = 0
          total_duration.value = 0
          events.clear
        end

        ActiveSupport::Notifications.subscribe 'sql.active_record' do |*args|
          event = ActiveSupport::Notifications::Event.new(*args)
          query_count.update { |value| value + 1 }
          total_duration.update { |value| value + event.duration }
          events.push(event)
        end
      end
    end
  end
end
