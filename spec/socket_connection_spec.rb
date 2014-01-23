require 'spec_helper'
require 'pry'
describe SocketConnection do

  let(:socket){ SocketConnection.new }

  describe '#new' do
    it 'initializes a new WebSocketConnection instance' do
      expect(socket).to be
    end
  end

  describe '#connection' do

    it 'creates a reference to a WebSocket object' do
      expect(socket.connection).to be
    end

    it 'has a connect event' do
      connect_event = socket.connection.__events.select do |event|
        event[:type] == :connect
      end
      expect(connect_event).to be
    end
  end

end