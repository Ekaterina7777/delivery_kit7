class CardController < ApplicationController
  def create
    Card.create user: current_user, product_id: params[:product_id], count: 1
    redirect_to card_url
  end

  def index 
    @cards = Card.where(user: current_user)
    
  end
end
