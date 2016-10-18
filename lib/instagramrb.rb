require "instagramrb/version"

module Instagramrb
  class << self

    def client(options={})
      @client = Instagram::Client.new(options) unless @client
      @client
    end

  end
end
