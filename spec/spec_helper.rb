require 'rickshaw'

RSpec.configure do |c|
  VALID_RICKSHAW_ACCOUNT_ID = 'XXXXXX'
  VALID_RICKSHAW_PARCEL_ID = 'YYYYYY'

  def configure_valid_rickshaw_account
    Rickshaw.configure(VALID_RICKSHAW_ACCOUNT_ID)
  end
end
