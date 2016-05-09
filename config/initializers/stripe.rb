#Stripe.api_key = ENV["stripe_api_key"]
#STRIPE_PUBLIC_KEY = ENV["stripe_publishable_key"]
Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]