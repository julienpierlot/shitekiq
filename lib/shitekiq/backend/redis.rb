require 'redis'
require 'json'

module Shitekiq
  module Backend
    class Redis
      def initialize(connection = ::Redis.new)
        @connection = connection
      end

      def push(job_data)
        @connection.lpush('shitekiq:queue', JSON.dump(job_data))
      end

      def pop
        _queue, job = @connection.brpop('shitekiq:queue')
        payload = JSON.parse(job, symbolize_names: true)
        payload[:job] = Object.const_get(payload[:job])
        payload
      end
    end
  end
end
