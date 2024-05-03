class HealthController < ApplicationController
  def check
    render json: { status: 'success' }
  end
end
