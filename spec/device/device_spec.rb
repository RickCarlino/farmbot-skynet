require 'spec_helper'

describe Device do

  let(:device) do
    Device.new
  end

  describe '#new' do
    it 'initializes a new Device instance' do
      expect(device).to be_kind_of(Device)
    end
  end

  describe '#uuid' do
    it 'returns a valid UUID'
  end

  describe '#token' do
    it 'returns a valid token'
  end
end