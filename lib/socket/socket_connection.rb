require 'socket.io-client-simple'
require_relative 'event_handler'
require_relative 'socket_events'
require_relative 'credentials'

class SocketConnection

  include EventHandler, SocketEvents, Credentials

  attr_accessor :connection, :uuid, :token

  def initialize(credentials = {})
    load_or_create_credentials(credentials)
    create_socket_connection
    create_socket_events
  end

end