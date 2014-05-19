# encoding: UTF-8

require "eventmachine"
require "multi_json"
require "logger"
require "extensions/hash"
require "em-apn/client"
require "em-apn/connection"
require "em-apn/notification"
require "em-apn/log_message"
require "em-apn/response"
require "em-apn/error_response"

# HACK: em-logger puts its Logger class inside the EventMachine namespace, but
# we still need to be able to reference the stdlib Logger class.
BaseLogger = Logger
require "em-logger"

module EventMachine
  module APN
    def self.logger
      @logger ||= EM::Logger.new(BaseLogger.new(STDOUT))
    end

    def self.logger=(new_logger)
      @logger = EM::Logger.new(new_logger)
    end
  end
end
