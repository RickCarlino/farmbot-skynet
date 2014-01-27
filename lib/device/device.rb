require_relative 'credentials'
require 'socket.io-client-simple'

# Tim Evers already wrote a controller library for the FarmBot device.
# This is just a stub for now until I can integrate the two projects.
class Device

  include Credentials

  attr_accessor :socket, :uuid, :token

  def initialize
    creds   = credentials
    @uuid   = creds[:uuid]
    @token  = creds[:token]
    @socket = SocketIO::Client::Simple.connect 'http://skynet.im:80'
    puts "[#{Time.now.to_s}] Attempting to connect..."
    create_socket_events
  end

  def create_socket_events
    @socket.on :connect do
      puts "[#{Time.now.to_s}] Connected"
    end

    @socket.on :identify do |data|
      self.emit :identity, {
        uuid: $device.uuid,
        token: $device.token,
        socketid: data['socketid']}
      puts "[#{Time.now.to_s}] Sent device identity"
    end

    @socket.on :ready do |data|
      puts "[#{Time.now.to_s}] Device ready"
    end

    @socket.on :disconnect do
      puts "[#{Time.now.to_s}] Offline"
    end

    @socket.on :message do |channel, message|
      puts "[#{Time.now.to_s} - #{channel}] #{message}"
    end
  end

end