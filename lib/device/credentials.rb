require 'securerandom'

module Credentials
  def credentials_file
    'credentials.yml'
  end

  def credentials
    if valid_credentials?
      return load_credentials
    else
      return create_credentials
    end
  end

  def valid_credentials?
    if File.file?(credentials_file)
      #TODO: Memoize all of these file reads for efficiency / DRYness
      cred = YAML.load(File.read(credentials_file))
      return true if cred.has_key?(:uuid) && cred.has_key?(:token)
    end
    return false
  end

  def create_credentials
      puts "[#{Time.now.to_s}] Warning!! Credentials.yml not found. Creating a"\
        "new set of credentials now."
      @uuid  = SecureRandom.uuid
      @token = SecureRandom.hex
      `curl -X POST -d "uuid=#{@uuid}&token=#{@token}&type=farmbot" http://skynet.im/devices`
      yaml   = {uuid: @uuid, token: @token}.to_yaml
      File.open(credentials_file, 'w+') {|file| file.write(yaml) }
      return {uuid: @uuid, token: @token}
  end

  def load_credentials
    return YAML.load(File.read(credentials_file))
  end

end