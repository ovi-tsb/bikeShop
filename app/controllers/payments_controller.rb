class PaymentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]
      # Create the charge on Stripe's servers - this will charge the user's card
      begin
        charge = Stripe::Charge.create(
          amount: (@product.price*100).to_i, # amount in cents, again
          currency: "usd",
          source: token,
          receipt_email: (@user.email),
          description: params[:stripeEmail]
        )

        if charge.paid
          Order.create(product_id: @product.id,user_id: @user.id, total: @product.price ) 
          flash[:notice] = "Your payment was processed successfully" 
        end

      rescue Stripe::CardError => e
        # The card has been declined
        body = e.json_body
        err = body[:error]
        flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      end
      redirect_to product_path(@product)
  end
end
