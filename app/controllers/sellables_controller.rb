class SellablesController < ApplicationController
  def new
    @cards = CardDecorator.decorate_collection(Card.all)
  end
end
