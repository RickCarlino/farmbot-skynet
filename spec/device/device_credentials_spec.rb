require 'spec_helper'

describe Device do

  let(:device) do
    Device.new
  end

  describe '#credentials_file' do
    it 'returns name of the credentials YML file' do
      expect(device.credentials_file).to eq('credentials.yml')
    end
  end

  describe '#load_credentials' do
    it 'loads the credentials YML file' do
      expected = YAML.load(File.read(device.credentials_file))
      actual   = device.load_credentials
      expect(expected).to eq(actual)
    end
  end

  describe '#create_credentials' do
    it 'creates device UUID' do
      old_uuid = device.uuid
      device.create_credentials
      new_uuid = device.uuid
      expect(old_uuid).to_not eq(new_uuid)
    end
    it 'creates device token' do
      old_token = device.token
      device.create_credentials
      new_token = device.token
      expect(old_token).to_not eq(new_token)
    end
  end

  describe '#valid_credentials?' do
    it 'ensures presence of UUID' do
    end
    it 'ensures presence of token' do
    end
  end

  describe '#credentials' do
    it 'has a valid `UUID` key' do
      expect(device.credentials[:uuid]).to be_instance_of(String)
    end
    it 'has a valid `token` key' do
      expect(device.credentials[:token]).to be_instance_of(String)
    end
  end

end