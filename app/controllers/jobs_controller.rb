# frozen_string_literal: true

class JobsController < ApplicationController
  respond_to :json

  def index
    jobs = Job.all
    render json: {
      status: { code: 200 },
      data: JobSerializer.new(jobs)
    }
  end

  def create
    current_user.jobs.build(job_params)
    # job = Job.new(job_params)
    authorize job
    job.save!
    response = JobService.new(job, 'Job')
    render json: response.call
  end

  def like_job
    job = Job.find(params[:id])
    authorize job
    job.like.push(current_user)
    response = JobService.new(job, 'Job liking')
    render json: response.call
  end

  private

  def job_params
    params.require(:job).permit(:id, :name, :description, :location, :logo, :poster, :like)
  end
end
