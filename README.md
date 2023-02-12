# Lazerpay Ruby SDK

Paystack gem for Ruby api only application

### Installation

Simply add this line to your application's Gemfile:

```ruby
gem 'lazerpay'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paystack

## Basic Usage


### Instantiate Paystack Object

```ruby
    require 'paystackapi'

    lazerpay = LazerPay.new( public_key, secret_key );

```
⚠️ Public and Secret key should be loaded from an `.env` file.



###  Payment 💰
###### The initialize payment method allows you to initiate payment directly to Lazerpay by passing in the payment details

```ruby
    payment_details = lazerpay.payment.init({
        customer_name: "Owoade Anuoluwapo",
        customer_email: "owoadeanu@yahoo.com",
        coin: "USDT",
        currency: "NGN",
        accept_partial_payment: false
    })

```
To know more about the body attributes visit [the docs](https://docs.lazerpay.finance/home/payments/accept-payments#initialize-payment-api)

###### To verify transactions use the verify method on the payment object passing your transaction reference or id as an argument.

###### Here's a code sample for verifying transactions:

```ruby
    payment_status = lazerpay.payment.verify( "XcaAbnyQ" )

```

###### Generate a Standard payment link

```ruby
    standard_link_object = lazerpay.payment.get_standard_link( payload )

```

To know about content of the payload object click [here](https://docs.lazerpay.finance/home/payments/payment-links/standard-payment-link#create-a-new-standard-payment-link)

###### Generate a Standard donation link

```ruby
    donation_link_object = lazerpay.payment.get_dontion_link( payload )

```

To know about content of the payload object click [here](https://docs.lazerpay.finance/home/payments/payment-links/donations-payment-link#create-a-new-donation-payment-link-1)




###  Payout ⚡
###### Bank payout

```ruby
    bank_payout_object = lazerpay.payout.bank( payload )

```
To know about content of the payload object click [here](https://docs.lazerpay.finance/home/payouts/bank-payouts#create-bank-payout)

###### Crypto payout

```ruby
    crypto_payout_object = lazerpay.payout.crypto( payload )

```
To know about content of the payload object click [here](https://docs.lazerpay.finance/home/payouts/crypto-payouts#crypto-transfer-api)


###  Deposit 💸
###### Crypto deposit

To initiate a crypto deposit, the asset to be deposited must be passed an argument. Accepted assets `USDT | BUSD | USDC | DAI` 

```ruby
    crypto_deposit_object = lazerpay.crypto_deposit.get_wallet_address( token )
```

###### FIAT deposit

Initiate FIAT deposit

```ruby
    crypto_deposit_object = lazerpay.fiat_deposit.init( payload )
```
To know about content of the payload object click [here](https://docs.lazerpay.finance/home/top-up/fiat-deposit#initiate-on-ramp)


Get funding rate

```ruby
    crypto_deposit_object = lazerpay.fiat_deposit.getting_funding_rate( currency )
```
Currency can be either `USD | NGN`

Get accounts available for funding

```ruby
    crypto_deposit_object = lazerpay.fiat_deposit.getting_available_accounts
```

###  Swap 🔒
###### Initialize

```ruby
    swap_object = lazerpay.crypto_swap.init( payload )
```
To know about content of the payload object click [here](https://docs.lazerpay.finance/home/swaps/stablecoins-swap#crypto-swap-api)


###### Get Crypto Swap Amount Out

```ruby
    swap_object = lazerpay.crypto_swap.get_swap_amount( payload )
```
To know about content of the payload object click [here](https://docs.lazerpay.finance/home/swaps/stablecoins-swap#crypto-swap-api)


###  Transaction 💳
###### Retrieve a particular transaction by passing the transaction refernce.

```ruby
    transaction = lazerpay.transaction.get( reference )
```

###### Retrieve all transactions

```ruby
    transactions = lazerpay.transaction.get_all
```


### Contributing

Please feel free to fork this package and contribute by submitting a pull request to enhance the functionalities.


Created with 🧡 by [Owoade](https://my-portfolio-owoade.vercel.app/)















