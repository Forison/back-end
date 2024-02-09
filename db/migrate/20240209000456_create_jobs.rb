# frozen_string_literal: true

class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
