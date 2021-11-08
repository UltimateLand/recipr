# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user
  validates_presence_of :dish, :description
end
