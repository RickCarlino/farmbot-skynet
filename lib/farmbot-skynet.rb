require_relative 'socket/socket'
require_relative 'device/device'

@device = Device.new

#Pass a 'dev' argument to run a console session
if ARGV.include? "dev"
  require 'pry'
  binding.pry
end

