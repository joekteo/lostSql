class JobsController < ApplicationController

  def index
    @jobs = params[:ids] ?
      Job.where(id: params[:ids].split(",")).to_a :
      Job.all.to_a
  end

  def create_or_replace
    if job = Job.find_by( id: params[:id] )
      replacement= Job.new(
          job_params.merge( id: params[:id] )
        )
      if replacement.valid?
        job.destroy
        replacement.save
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      if job = Job.create(
          job_params.merge( id: params[:id] )
        )
        render json: job, status: :created
      else
        head :unprocessable_entity
      end
    end

  end

  def update
    if job = Job.find_by( id: params[:id] )
      if job.update_attributes( job_params )
        head :no_content
      else
        head :unprocessable_entity
      end
    else
      head :not_found
    end
  end

  def destroy
    if job = Job.find_by( id: params[:id] )
      if job.destroy
        head :no_content
      else
        head :internal_server_error
      end
    else
      head :not_found
    end
  end

  protected

  def job_params
    params.require(:job).permit( :title, :body )
  end
end