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
      warn 'WARNING: Credentials were either not found or did not contain '\
           'valid information. A new set of credentials will now be created.'\
           'any credentials that existed in credentials.yml will be overwriten'
      @uuid  = SecureRandom.uuid
      @token = SecureRandom.hex
      yaml   = {uuid: @uuid, token: @token}.to_yaml
      File.open(credentials_file, 'w+') {|file| file.write(yaml) }
  end

  def load_credentials
    return YAML.load(File.read(credentials_file))
  end

end