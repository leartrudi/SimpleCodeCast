class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan
  has_one :profile
  attr_accessor :stripe_card_token
  

  def save_with_payment
    if valid?
       require "stripe"
      Stripe.api_key = "sk_test_E3kG8D0f8TfuOKkdPtHSOnlt"
      #Stripe::Plan.retrieve("2")
      customer = Stripe::Customer.create(email: email, source: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end
end
