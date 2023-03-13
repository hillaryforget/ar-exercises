# frozen_string_literal: true

require 'active_record'

# This class represents an employee in the company. It has methods for setting and getting the employee's name and salary.
class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, :last_name, :store_id, presence: true
  validates :hourly_rate, inclusion: 40..200, numericality: { only_integer: true }
  validates :store, presence: true
end
