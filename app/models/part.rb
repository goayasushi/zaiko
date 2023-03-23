class Part < ApplicationRecord
  belongs_to :user
  belongs_to :client

  validates :part_name, presence: true
  with_options presence: true, format: { with: /\A\d*\z/ } do
    validates :purchase_price, numericality: { only_integer: true }
    validates :selling_price, numericality: { only_integer: true }
  end
end
