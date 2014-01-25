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

end