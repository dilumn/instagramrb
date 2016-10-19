require "instagramrb/version"
require "instagramrb/client"

module Instagramrb
  class << self

    def client(options={})
      @client = Instagramrb::Client.new(options) unless @client
      @client
    end

  end
end
