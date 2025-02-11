require "test_helper"

class ProductMailerTest < ActionMailer::TestCase
  test "in_stock" do
    mail = ProductMailer.with(mail_params).in_stock

    assert_equal "Product available!", mail.subject
    assert_equal [ "david@example.com" ], mail.to
    assert_equal "pedro@gmail.com", mail.from.first
    assert_match "Good News!", mail.body.encoded
  end

  private

  def mail_params
    {
      product: products(:tshirt),
      subscriber: subscribers(:david)
    }
  end
end
