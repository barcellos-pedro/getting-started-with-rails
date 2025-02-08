class ProductMailer < ApplicationMailer
  def in_stock
    subscriber = params[:subscriber]
    @greeting = "Good News!"
    @product = params[:product]
    @token = subscriber.generate_token_for(:unsubscribe)

    mail to: subscriber.email
  end
end
