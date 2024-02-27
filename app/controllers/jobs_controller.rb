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
    if job.like.include?(current_user.id)
      job.like.delete(current_user.id)
    else
      job.like.push(current_user.id)
    end
    job.save!
    render json: { has_like: job.like.include?(current_user.id) }
  end

  def favorite_job
    job = Job.find(params[:id])
    authorize job
    render json: { has_like: job.like.include?(current_user.id) }
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
