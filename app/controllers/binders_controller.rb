
class BindersController < ApplicationController
  def create
    new_binder = current_user.binders.create(allowed_params)

    if new_binder.valid?
      flash[:notice] = "Binder #{new_binder.name} added!"
      redirect_to profile_path
    else
      flash[:notice] = "Bad binder"
      render "new"
    end
  end

  def new
  end

  private

  def allowed_params
    params.require(:binder).permit(
      :name
    )
  end
end