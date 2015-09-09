class Api::V1::ChallengesController < ApplicationController
  respond_to :json

  def show
    respond_with Challenge.find(params[:id])
  end

  def create
    challenge = Challenge.new(challenge_params)
    if challenge.save
      render json: challenge, status: 201, location: [:api, challenge]
    else
      render json: { errors: challenge.errors }, status: 422
    end
  end

  def update
    challenge = Challenge.find(params[:id])

    if challenge.update(challenge_params)
      render json: challenge, status: 200, location: [:api, challenge]
    else
      render json: { errors: challenge.errors }, status: 422
    end
  end

  def destroy
    challenge = Challenge.find(params[:id])
    head 202 if challenge.destroy
  end

  private

  def challenge_params
    params.require(:challenge).permit(:email, :password, :password_confirmation)
  end
end
