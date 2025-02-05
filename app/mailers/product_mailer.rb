class ProductMailer < ApplicationMailer
  def in_stock
    @greeting = "Good News!"
    @product = params[:product]

    mail to: params[:subscriber].email
  end
end
