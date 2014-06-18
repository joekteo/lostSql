class DutiesController < ApplicationController

  def index
    @duties = params[:ids] ?
      Duty.where(id: params[:ids].split(",")).to_a :
      Duty.all.to_a
  end

  def create_or_replace
    if duty = Duty.find_by( id: params[:id] )
      replacement= Duty.new(
          duty_params.merge( id: params[:id] )
        )
      if replacement.valid?
        duty.destroy
        replacement.save
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      if duty = Duty.create(
          duty_params.merge( id: params[:id] )
        )
        render json: duty, status: :created
      else
        head :unprocessable_entity
      end
    end

  end

  def update
    if duty = Duty.find_by( id: params[:id] )
      if duty.update_attributes( duty_params )
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end

  def destroy
    if duty = Duty.find_by( id: params[:id] )
      if duty.destroy
        head :no_content
      else
        head :internal_server_error
      end
    else
      head :not_found
    end
  end

  protected

  def duty_params
    params.require(:duty).permit( :title, :body )
  end
end