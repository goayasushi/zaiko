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

  def self.search(search)
    if search != ""
      Sale.where('shipping_day <= ?', search)
    else
      Sale.all
    end
  end
end
