require_relative "./lazerpay/main_module.rb";
require "dotenv/load"

class LazerPay 
    attr_accessor :secret_key, :public_key, :payment

    def initialize public_key = nil, secret_key = nil
        @secret_key = secret_key;
        @public_key = public_key;

        # Error Handling

        raise "Public key cannot be undefined" if @public_key.nil?

        raise "Secret key cannot be undefined" if @secret_key.nil?

        raise "Invalid format for Public key, it must with 'pk'" unless @public_key.start_with?("pk_")

        raise "Invalid format for Secret key, it must with 'sk'" unless @secret_key.start_with?("sk_")


        @payment = LazerPayModule::Payment.new( @public_key, @secret_key );


    end
end 

lp = LazerPay.new(ENV["LP_PK"], ENV["LP_SK"]);
