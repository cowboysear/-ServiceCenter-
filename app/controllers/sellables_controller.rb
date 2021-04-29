class SellablesController < ApplicationController
  def new
    @cards = CardDecorator.decorate_collecti