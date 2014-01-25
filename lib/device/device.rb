require_relative 'credentials'
# Tim Evers already wrote a controller library for the FarmBot device.
# This is just a stub for now until I can integrate the two projects.
class Device

  include Credentials

  attr_accessor :socket, :uuid, :token

  def initialize
    creds   = credentials
    @uuid   = creds[:uuid]
    @token  = creds[:token]
    @socket = Socket.new(creds)
  end

end