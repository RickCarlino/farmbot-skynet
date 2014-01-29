require_relative 'credentials'
require_relative 'web_socket'

# Tim Evers already wrote a controller library for the FarmBot device.
# This is just a stub for now until I can integrate the two projects.
class Device

  include Credentials, WebSocket

  attr_accessor :socket, :uuid, :token

  def initialize
    creds   = credentials
    @uuid   = creds[:uuid]
    @token  = creds[:token]
    @socket = SocketIO::Client::Simple.connect 'http://skynet.im:80'
    create_socket_events
  end

  def handle_message(channel, message)
    message_hash = JSON.parse(message)
    puts "Got a message on channel '#{channel}':"
    puts message_hash.to_yaml + "\n"
  rescue
    raise 'Runtime error while attempting to parse message: #{message}.'
  end

end