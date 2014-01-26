require 'spec_helper'

describe Device do

  let(:device) do
    Device.new()
  end

  describe '#credentials_file' do
    it 'returns name of the credentials YML file' do
      expect(device.credentials_file).to eq('credentials.yml')
    end
  end

  describe '#load_credentials' do
    it 'loads the credentials YML file'
  end

  describe '#create_credentials' do
    it 'creates device UUID'
    it 'creates device token'
    it 'persists credentials to a YML file'
  end

  describe '#valid_credentials?' do
    it 'ensures presence of UUID'
    it 'ensures presence of token'
  end

  describe '#credentials' do
    it 'has a valid `UUID` key'
    it 'has a valid `token` key'
  end

end