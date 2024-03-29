# frozen_string_literal: true

class JobPolicy
  attr_reader :user, :job

  def initialize(user, job)
    @user = user
    @job = job
  end

  def create?
    @user ? true : false
  end

  def like_job?
    create? && @job.present?
  end

  def favorite_job?
    like_job?
  end
end
