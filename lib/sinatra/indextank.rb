require 'sinatra/base'
require 'indextank'

module Sinatra
  module IndexTankHelper
    def indextank
      settings.indextank
    end
  end

  module IndexTankExtension
    def indextank=(url)
      @indextank = nil
      set :indextank_url, url
      indextank
    end

    def indextank
      synchronize { @indextank ||= IndexTank::Client.new(indextank_url) }
    end

    protected
    def self.registered(app)
      app.set :indextank_url, ENV['INDEXTANK_API_URL']
      app.helpers IndexTankHelper
    end
  end

  register IndexTankExtension
end
