require 'spec_helper'

describe Socket do

  #TODO: Does VCR support websockets yet? Oh crap, this will be hard to test!
  let(:socket) do
    @uuid  = '301ed6f1-8232-11e3-a399-f5b85b6b9fd0'
    @token = 'p18x1xhaymlmzpvizbqj9o3ctfswcdi'
    Socket.new(
    uuid:  @uuid,
    token: @token)
  end

  describe '#new' do
    it 'initializes a new WebSocketConnection instance' do
      expect(socket).to be_kind_of(Socket)
    end
  end

  describe '#connection' do
    it ''
  end

describe '#uuid' do
    it ''
  end

describe '#token' do
    it ''
  end

end