class Client < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :client_name
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :block
    validates :phone, format: {with: /\A\d{10,11}\z/ }
  end
  validates :prefecture_id, numericality: {other_than: 1}

end
