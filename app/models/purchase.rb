class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :part

  validates :arrival_day, presence: true
  with_options presence: true, format: { with: /\A\d*\z/ } do
    validates :purchase_quantity, numericality: { only_integer: true }
  end
end
