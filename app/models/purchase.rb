class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :part

  validates :arrival_day, presence: true
  with_options presence: true, format: { with: /\A\d*\z/ } do
    validates :purchase_quantity, numericality: { only_integer: true }
  end

  def self.totle_purchase_quantity(part_id)
    Purchase.where(part_id: part_id).sum(:purchase_quantity)
  end
  
  def self.search(search)
    if search != ""
      Purchase.where('arrival_day <= ?', search)
    else
      Purchase.all
    end
  end
end
