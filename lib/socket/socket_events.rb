module SocketEvents
  module ClassMethods
  end

  module InstanceMethods

    def create_socket_connection
      @connection = SocketIO::Client::Simple.connect 'http://skynet.im:80'
    end

    def create_socket_events
      event_list = [:connect, :disconnect, :identify, :ready, :message, :update,
        :register, :unregister, :whoami, :devices, :status]

      event_list.each do |event|
        method_name = 'handle_' + event.to_s
        @connection.on(event){|data| self.send(method_name, data)}
      end
    end
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end