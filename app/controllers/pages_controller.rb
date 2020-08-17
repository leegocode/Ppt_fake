class PagesController < ApplicationController

  def index
  end

  def pricing
  end


  def payment
    @token = gateway.client_token.generate
    @plan = params[:plan]
    @price = case @plan
    when "a"
      5
    when "b"
      20
    else
      "參數錯誤"
    end
  end

private
def gateway
  Braintree::Gateway.new(
    :environment => :sandbox,
    :merchant_id => 'b9znt8x85cxdpt5t',
    :public_key => 'gfd6zbx5sbhjtmbd',
    :private_key => 'e6a195a4af7f788b7c1eb975fd7f6026',
  )
end
end
