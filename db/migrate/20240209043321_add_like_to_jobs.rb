# frozen_string_literal: true

class AddLikeToJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :like, :integer, array: true, default: []
  end
end
