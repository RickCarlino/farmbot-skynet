require 'socket.io-client-simple'
require_relative 'event_handler'
require_relative 'socket_events'

class Socket

  include EventHandler, SocketEvents

  attr_accessor :connection, :uuid, :token

  def initialize(credentials)
    @uuid  = credentials[:uuid]
    @token = credentials[:token]
    create_socket_connection
    create_socket_events
  rescue
    raise 'Unable to initialize WebSocket connection to SkyNet'
  end

end