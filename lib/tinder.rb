# encoding: UTF-8
require 'tinder/connection'
require 'tinder/campfire'
require 'tinder/room'
require 'logger'

module Tinder
  class Error < StandardError; end
  class SSLRequiredError < Error; end
  class AuthenticationFailed < Error; end
  class ListenFailed < Error; end

  def self.logger
    @logger ||= Logger.new(tinder_log)
  end

  def self.logger=(logger)
    @logger = logger
  end

protected

  def self.tinder_log
    if ENV['TINDER_LOGGING']
      STDOUT
    elsif ENV['TINDER_LOGFILE']
      ENV['TINDER_LOGFILE']
    else
      nil
    end
  end

end
