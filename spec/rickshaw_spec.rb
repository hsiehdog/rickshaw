require 'spec_helper'

describe Rickshaw do
  describe '#configure' do
    it 'raises an exception when nothing is passed in' do
      expect {Rickshaw.configure}.to raise_exception
    end
    it 'returns 404 when an invalid key is passed in' do
      Rickshaw.configure('abc')
      expect(Rickshaw::Parcel.get_all.parsed_response['detail']).to eq('No such user')
    end
    it 'configures' do
      configure_valid_rickshaw_account
      expect(Rickshaw::Parcel.get_all.parsed_response['page']).to eq(1)
    end
  end
end
