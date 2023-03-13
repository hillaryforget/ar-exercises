# frozen_string_literal: true

require 'active_record'

# This class represents a store in the company. It has methods for setting and getting the store's name and address.
class Store < ActiveRecord::Base
  has_many :employees
  validates :name, presence: true, length: 3..100
  validates :annual_revenue, inclusion: 0.., presence: true, numericality: { only_integer: true }
  validate :must_carry_mens_or_womens_apparel

  def must_carry_mens_or_womens_apparel
    return unless !mens_apparel && !womens_apparel

    errors.add(:womens_apparel, "must carry men's apparel or wommen's apparel.")
    errors.add(:mens_apparel, "must carry men's apparel or wommen's apparel.")
  end
end
