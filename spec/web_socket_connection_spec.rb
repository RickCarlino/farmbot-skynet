require 'spec_helper'

describe WebSocketConnection do

  let(:socket){ WebSocketConnection.new }

  describe '#new' do
    it 'initializes a new WebSocketConnection instance' do
      expect(socket).to be
    end
  end

end