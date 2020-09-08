class ChargesController < ApplicationController

  def new
    @charge = Charge.new
    @charge.user = current_user
    @charge.image = Image.find(get_current_image)
  end
  
  def create
  
    @charge = Charge.new
    @charge.user = current_user
    @charge.image = Image.find(get_current_image)
    @amount = (@charge.image.price * 100).to_int
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
    
    if @charge.image.inventory > 0
      Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'usd',
      })
      @charge.image.inventory = @charge.image.inventory - 1
      @charge.image.save
      flash[:notice]= "Thanks, you paid $#{@charge.image.price}!"
    end
  end
end