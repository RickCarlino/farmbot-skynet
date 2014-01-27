require_relative 'device/device'

# The socketio library we use is acting strange. Global for now until we find a
# way to bind events to the Device object context
$device = Device.new

#Pass a 'dev' argument to run a console session
if ARGV.include? "dev"
  require 'pry'
  binding.pry
end

loop do
  # print 'Message >'
  # msg = eval(gets.chomp)
  # @device.socket.emit :message, {devices: 'all', message: msg}
  sleep 0.5
end