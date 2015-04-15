require 'spec_helper'

describe Rickshaw::Parcel do
  describe '#get' do
    before do
      configure_valid_rickshaw_account
    end
    it 'returns Not found when invalid id' do
      expect(Rickshaw::Parcel.get('abc')['detail']).to eql('Not found')
    end
    it 'returns valid parcel ID when valid id' do
      expect(Rickshaw::Parcel.get(VALID_RICKSHAW_PARCEL_ID)['uuid']).to eql(VALID_RICKSHAW_PARCEL_ID)
    end
  end

  describe '#create' do
    before do
      configure_valid_rickshaw_account
    end
    it 'shows field is required for empty hash' do
      expect(Rickshaw::Parcel.create({test_flag: true}).parsed_response['dest_address']).to eql(['This field is required.'])
    end
    # TODO: add more invalid cases
    it 'returns true for valid input' do
      body = {
        orig_min: '2015-04-30T19:00:00Z',
        orig_max: '2015-04-30T21:30:00Z',
        dest_min: '2015-04-30T19:30:00Z',
        dest_max: '2015-04-30T21:30:00Z',
        orig_address: "1 Front Street, San Francisco, CA",
        dest_address: "1 Market Street, San Francisco, CA",
        orig_instructions: 'Call Collin at 913-207-3947 when you arrive for help accessing the boxes',
        dest_instructions: "Leave at the front door",
        description: "Box for You",
        orig_name: 'Jon Doe',
        dest_name: 'Jane Doe',
        orig_phone: '913-207-3947',
        dest_phone: '415-555-1212',
        test_flag: true
      }
      expect(Rickshaw::Parcel.create(body).parsed_response['uuid']).to_not be_nil
    end
  end
end
