require 'remit/common'

module Remit
  module GetPurchaseContract
    class Request < Remit::Request
      action :GetPurchaseContract
      parameter :purchase_contract_id, :required => true
    end

    class Response < Remit::Response
      class GetPurchaseContractResult < Remit::BaseResponse

        class Address < Remit::BaseResponse
          parameter :name
          parameter :address_line_one
          parameter :address_line_two
          parameter :address_line_three
          parameter :city
          parameter :state_or_province_code
          parameter :postal_code
          parameter :country_code
          parameter :phone_number
        end

        class PhysicalDestinationAttributes < Remit::BaseResponse
          parameter :shipping_address, :type => Address
        end

        class Destination < Remit::BaseResponse
          parameter :destination_name
          parameter :destination_type
          parameter :physical_destination_attributes, :type => PhysicalDestinationAttributes
        end

        class Destinations < Remit::BaseResponse
          parameter :destination, :type => Destination
        end

        class PurchaseContract < Remit::BaseResponse
          parameter :id
          parameter :expiration_timestamp
          parameter :merchant_id
          parameter :marketplace_id
          parameter :state

          parameter :destinations, :type => Destinations
        end
        parameter :purchase_contract, :type => PurchaseContract
      end

      parameter :get_purchase_contract_result, :type => GetPurchaseContractResult
      parameter :response_metadata, :type=>ResponseMetadata
      
    end

    def get_purchase_contract(request = Request.new)
      call(request, Response)
    end
  end
end
