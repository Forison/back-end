# frozen_string_literal: true

class JobsController < ApplicationController
  respond_to :json

  def index
    jobs = Job.all
    render json: { data: JobSerializer.new(jobs) }
  end

  def create
    job = current_user.jobs.create(job_params)
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
    params.permit(
      :id,
      :name,
      :description,
      :location,
      :poster
    )
  end
end
