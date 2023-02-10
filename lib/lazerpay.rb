require_relative "./lazerpay/main_module.rb";
require "dotenv/load"

class LazerPay 
    attr_accessor :secret_key, :public_key, :payment, :fiat_deposit, :crypto_deposit, :payout, :crypto_swap, :transaction

     def initialize public_key = nil, secret_key = nil
        @secret_key = secret_key;
        @public_key = public_key;

        # Error Handling

        raise "Public key cannot be undefined" if @public_key.nil?

        raise "Secret key cannot be undefined" if @secret_key.nil?

        raise "Invalid format for Public key, it must with 'pk'" unless @public_key.start_with?("pk_")

        raise "Invalid format for Secret key, it must with 'sk'" unless @secret_key.start_with?("sk_")

        # Loads public and private key in to sub-classes
        LazerPayModule::Wrapper.new( @public_key, @secret_key )

        @payment = LazerPayModule::Payment.new;

        @payout = LazerPayModule::Payout.new;

        @fiat_deposit = LazerPayModule::Deposit::FIAT.new;

        @crypto_deposit = LazerPayModule::Deposit::CRYPTO.new;

        @crypto_swap = LazerPayModule::Swap.new;

        @transaction = LazerPayModule::Transaction.new;

    end
end 

lp = LazerPay.new(ENV["LP_PK"], ENV["LP_SK"]);

