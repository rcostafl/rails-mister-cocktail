# frozen_string_literal: true

# model for table doses
class Dose < ApplicationRecord
  validates :description, presence: true
  belongs_to :ingredient
  belongs_to :cocktail

  validates :ingredient, presence: true, uniqueness: { scope: :cocktail }
  validates :cocktail, presence: true
end
