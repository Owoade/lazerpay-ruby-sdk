require_relative "agent.rb";
module LazerPayModule

    class Wrapper
        @@sk = nil;
        @@pk = nil;

        def initialize public_key, secret_key
            @@pk = public_key;
            @@sk = secret_key;
        end
    
    end

    
    class Payment < Wrapper

        def initialize; end
           
        def init payload
            response = Agent.post( "/transaction/initialize", { secret_key: @@sk, public_key: @@pk, data: payload } );

            return response.to_h;
        end

        def verify reference
            response = Agent.get( "/transaction/verify", { secret_key: @@sk, public_key: @@pk, route_parameter: reference } );

            return response.to_h;
        end

        def get_standard_link payload
            response = Agent.post( "/payment_links/standard", { secret_key: @@sk, public_key: @@pk, data: payload } );

            return response.to_h;
        end
        
        def get_donation_link payload
            response = Agent.post( "/payment_links/donation", { secret_key: @@sk, public_key: @@pk, data: payload } );

            return response.to_h;
        end

    end

    class Payout < Wrapper

        def initialize; end

        def crypto payload
            response = Agent.post( "/crypto/payouts/initiate", { secret_key: @@sk, public_key: @@pk, data: payload } );

            return response.to_h;
        end

        def bank payload
            response = Agent.post( "/bank/payouts", { secret_key: @@sk, public_key: @@pk, data: payload } );

            return response.to_h;
        end

    end

    module Top_up 

        class FIAT < Wrapper

            def initialize; end

            def init payload
                response = Agent.post( "/bank/funding/initiate", { secret_key: @@sk, public_key: @@pk, data: payload } );

                return response.to_h;
            end

            def get_funding_rate currency
                response = Agent.get( "/bank/funding/rate", { secret_key: @@sk, public_key: @@pk, query_parameter: "currency=#{currency}" } );

                return response.to_h;
            end

            def get_available_accounts 
                response = Agent.get( "/bank/funding/accounts",  { secret_key: @@sk, public_key: @@pk } );

                return response.to_h;
            end
        end

    
        class CRYPTO < Wrapper

            def initialize; end

            def get_wallet_address coin
                response = Agent.get( "/crypto/funding/address", { secret_key: @@sk, public_key: @@pk, query_parameter: "coin=#{coin}" } );

                return response.to_h;
            end

        end

    end



    class Swap < Wrapper

        def initialize; end
        
        def init payload
            response = Agent.post( "/swap/crypto", { secret_key: @@sk, public_key: @@pk, data: payload } );

            return response.to_h;
        end

        def get_swap_amount payload
            response = Agent.post( "/swap/crypto/amount-out", { secret_key: @@sk, public_key: @@pk, data: payload } );

            return response.to_h;
        end
    end



    class Transaction < Wrapper

        def initialize; end

        def get transaction_id
            response = Agent.get( "/transactions", { secret_key: @@sk, public_key: @@pk, route_parameter: transaction_id } );

            return response.to_h;
        end

        def get_all
            response = Agent.get( "/transactions", { secret_key: @@sk, public_key: @@pk } );

            return response.to_h;
        end
    end
end