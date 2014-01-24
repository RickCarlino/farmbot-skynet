# Tim Evers already wrote a controller library for the FarmBot device.
# This is just a stub for now until I can integrate the two projects.
class Device

  attr_accessor :socket

  def initialize
    @socket = SocketConnection.new(load_credentials)


  end

  def load_credentials
      file = 'credentials.yaml'
      if File.file?(file)
        return YAML.load(File.read(file))
      else
        return {}
      end
  end

end