# frozen_string_literal: true

class Job < ApplicationRecord
  has_one_attached :poster
  belongs_to :user
  default_scope { order(created_at: :desc) }

  validates :name, :description, :location, presence: true
end
