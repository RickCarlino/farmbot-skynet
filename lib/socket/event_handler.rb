module EventHandler

    def handle_connect(data = {})
    end

    def handle_disconnect(data = {})
    end

    def handle_identify(data = {})
      @connection.emit(
          :identity,
          uuid: '301ed6f1-8232-11e3-a399-f5b85b6b9fd0',
          token: 'p18x1xhaymlmzpvizbqj9o3ctfswcdi',
          socketid: data['socketid']
        )
    end

    def handle_ready(data = {})
        status = data['status']
        case status
        when 201
          puts 'success!'
        else
          puts "WARNING: Got a status code of #{status}"\
               " expected 201."
        end
    end

    def handle_message(data = {})
    end

    def handle_update(data = {})
    end

    def handle_register(data = {})
    end

    def handle_unregister(data = {})
    end

    def handle_whoami(data = {})
    end

    def handle_devices(data = {})
    end

    def handle_status(data = {})
    end
end