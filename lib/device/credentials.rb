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
      cred = load_credentials
      return true if cred.has_key?(:uuid) && cred.has_key?(:token)
    end
    return false
  end

  def create_credentials
    hash = {
      uuid: (@uuid  = SecureRandom.uuid),
      token: (@token = SecureRandom.hex)
    }
    `curl -s -X POST -d 'uuid=#{@uuid}&token=#{@token}&type=farmbot' \
      http://skynet.im/devices`
    File.open(credentials_file, 'w+') {|file| file.write(hash.to_yaml) }
    return hash
  end

  def load_credentials
    return YAML.load(File.read(credentials_file))
  end

end