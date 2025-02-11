class ProductMailer < ApplicationMailer
  def in_stock
    @greeting = "Good News!"
    @product = params[:product]
    @token = subscriber.generate_token_for(:unsubscribe)

    mail to: subscriber.email
  end

  private

  def subscriber
    params[:subscriber]
  end
end
