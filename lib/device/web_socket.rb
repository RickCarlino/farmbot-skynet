require 'socket.io-client-simple'

module WebSocket
  def create_socket_events
    create_identify_event
    create_message_event
    #OTHER EVENTS: :identify, :identity, :ready, :disconnect, :message
  end

  def create_identify_event
    @socket.on :identify do |data|
      self.emit :identity, {
        uuid: $device.uuid,
        token: $device.token,
        socketid: data['socketid']}
    end
  end

  def create_message_event
    @socket.on :message do |channel, message|
      $device.handle_message(channel, message)
    end
  end

end