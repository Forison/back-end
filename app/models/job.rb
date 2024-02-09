# frozen_string_literal: true

class Job < ApplicationRecord
  has_one_attached :poster
  has_one_attached :logo
  belongs_to :user

  validates :name, :description, :location, presence: true
end
