module Rickshaw
  class Parcel
    PARCEL_URL = '/parcels'
    class << self
      def get(parcel_id)
        Rickshaw.get(PARCEL_URL, parcel_id)
      end

      def get_all
        Rickshaw.get_all(PARCEL_URL)
      end

      def create(options={})
        Rickshaw.create(PARCEL_URL, options)
      end
    end
  end
end
