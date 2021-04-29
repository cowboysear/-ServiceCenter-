
class ProfilesController < ApplicationController
  def show
    @binders = current_user.binders
  end
end