class MembershipsController < ApplicationController

  def index
    memberships = Membership.all
    render json: memberships
  end

  def create 
    membership = Membership.new(membership_params)
    if membership.save
      render json: membership 
    else
      render json: { errors: membership.errors.full_messages }, status: :unprocessable_entity
    end
  end
  #can use Memberships.new and membership.save instead

  private

  def membership_params
    params.require(:membership).permit(:client_id, :gym_id, :charge)
  end
end
