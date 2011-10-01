require 'sinatra/base'
require 'indextank'

module Sinatra
  module IndexTankHelper
    def indextank
      options.indextank
    end
  end

  module IndexTankExtension
    def indextank=(url)
      @indextank = nil
      set :indextank_url, url
      indextank
    end

    def indextank
      synchronize do
        @indextank ||= (
          client = IndexTank::Client.new(indextank_url)
          client
        )
      end
    end

    protected
      def self.registered(app)
        app.set :indextank_url, ENV['INDEXTANK_API_URL']
        app.helpers IndexTankHelper
      end

  end
  register IndexTankExtension
end
