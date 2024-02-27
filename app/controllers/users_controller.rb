# frozen_string_literal: true

class UsersController < ApplicationController
  def create_avatar
    current_user.image.attach(user_param[:image])
    render json: { status: { code: 200,
                             message: 'Your profile picture was updated successfully.' } }
  end

  def show_avatar
    render json: { data: rails_blob_url(current_user.image) }
  end

  def is_logged_in
    render json: { data: current_user ? true : false }
  end

  private

  def user_param
    params.permit(:image)
  end
end
