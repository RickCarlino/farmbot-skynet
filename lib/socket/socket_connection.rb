require 'socket.io-client-simple'
require_relative 'event_handler'
require_relative 'socket_events'
require 'pry'
class SocketConnection

  include EventHandler, SocketEvents

  attr_accessor :connection

  def initialize
    create_socket_connection
    create_socket_events
  end

end