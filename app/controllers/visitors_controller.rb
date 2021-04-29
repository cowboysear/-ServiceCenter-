
class VisitorsController < ApplicationController
  def index
    if current_user
      redirect_to profile_path
    end
  end
end