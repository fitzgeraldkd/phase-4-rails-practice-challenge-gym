class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_record
  rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found

  private

  def render_invalid_record(invalid)
    render json: invalid.record.errors.full_messages, status: :unprocessable_entity
  end

  def render_record_not_found(errors)
    render json: errors, status: :not_found
  end

end
