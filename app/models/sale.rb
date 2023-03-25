class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :part

  validates :shipping_day, presence: true
  with_options presence: true, format: { with: /\A\d*\z/ } do
    validates :sale_quantity, numericality: { only_integer: true }
  end

  def self.totle_sale_quantity(part_id)
    Sale.where(part_id: part_id).sum(:sale_quantity)
  end
end
