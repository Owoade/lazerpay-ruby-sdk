require_relative "agent.rb";
module LazerPayModule
    class Payment
        attr_accessor :sk, :pk

        def initialize public_key, secret_key
            @pk = public_key;
            @sk = secret_key;
        end

        def init payload
            response = Agent.post( "/transaction/initialize", { secret_key: @sk, public_key: @pk, data: payload } );

            return response.to_h;
        end

        def verify reference
            response = Agent.get( "/transaction/verify", { secret_key: @sk, public_key: @pk, route_parameter: reference } );

            return response.to_h;
        end

        def get_standard_link payload
            response = Agent.post( "/payment_links/standard", { secret_key: @sk, public_key: @pk, data: payload } );

            return response.to_h;
        end
        
        def get_donation_link payload
            response = Agent.post( "/payment_links/donation", { secret_key: @sk, public_key: @pk, data: payload } );

            return response.to_h;
        end

    end
end