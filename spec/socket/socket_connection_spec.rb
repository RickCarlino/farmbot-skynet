require 'spec_helper'

describe SocketConnection do

  #TODO: Install VCR to prevent test suite from creating API requests.
  # Right now I'm just using some known good test credentials Chris gave me
  let(:socket) do
    SocketConnection.new(
    uuid: '301ed6f1-8232-11e3-a399-f5b85b6b9fd0',
    token: 'p18x1xhaymlmzpvizbqj9o3ctfswcdi')
  end

  describe '#new' do
    it 'initializes a new WebSocketConnection instance' do
      expect(socket).to be
    end
  end

end