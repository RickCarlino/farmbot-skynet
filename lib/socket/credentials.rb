require 'securerandom'

module Credentials
    def load_or_create_credentials(credentials)
      if credentials.has_key?(:uuid) && credentials.has_key?(:token)
        @uuid  = credentials[:uuid]
        @token = credentials[:token]
      else
        load_credentials
      end
    end

    def load_credentials
      warn 'WARNING: Credentials were either not found or did not contain '\
           'valid information. A new set of credentials will now be created.'\
           'any credentials that existed in credentials.yml will be overwriten'
      @uuid  = SecureRandom.uuid
      @token = SecureRandom.hex
      yaml   = {uuid: @uuid, token: @token}.to_yaml
      File.open('credentials.yml', 'w+') {|f| f.write(yaml) }
    end
end