# frozen_string_literal: true

require_relative "shitekiq/version"
require_relative "shitekiq/backend/redis"

module Shitekiq
  class Error < StandardError; end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def self.configure(&block)
    yield self
  end

  def self.backend
    @backend ||= Queue.new
  end

  def self.backend=(provider)
    @backend = provider
  end

  def self.pool_size=(count)
    count.times do |number|
      thread = Thread.new do
        loop do
          payload = backend.pop
          job = payload[:job]
          job.new.perform(payload[:args])
        end
      end
      thread.name = "Thread #{number + 1}"
    end
  end

  module ClassMethods
    def perform_now(*args)
      new.perform(*args)
    end

    def perform_async(*args)
      Shitekiq.backend.push(job: self, args: args)
    end
  end

  def perform(*args)
    raise NotImplementedError
  end
end
