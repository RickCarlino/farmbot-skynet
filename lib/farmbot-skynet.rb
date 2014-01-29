require_relative 'device/device'

# The socketio library we use is acting strange. Global for now until we find a
# way to bind events to the Device object context
$device = Device.new

#TODO: Daemonize this script:
#https://www.ruby-toolbox.com/categories/daemonizing
