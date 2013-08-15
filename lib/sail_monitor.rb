require 'sinatra/base'

module Sail
  class Monitor < ::Sinatra::Base
    get '/pingdom.xml' do
      start = Time.now
      ObjectSpace.each_object( eval "DataMapper::Model" ) {|o| o.first} if defined? DataMapper::Model
      "<pingdom_http_custom_check><status>OK</status><response_time>#{Time.now -  start}</response_time></pingdom_http_custom_check>"
    end
  end
end
