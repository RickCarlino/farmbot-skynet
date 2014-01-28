require 'socket.io-client-simple'
module WebSocket
  #TODO: Reduce complexity here... RC.
  def create_socket_events
    #OTHER EVENTS: :identify, :identity, :ready, :disconnect, :message
    @socket.on :identify do |data|
      self.emit :identity, {
        uuid: $device.uuid,
        token: $device.token,
        socketid: data['socketid']}
    end

    # @socket.on :message do |channel, message|
    # end
  end
end