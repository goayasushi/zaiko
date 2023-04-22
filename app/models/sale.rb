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

  def self.chart
    sales = Sale.includes(:user)
    data = {}
    datas = []
    sales.each do |sale|
      profit = sale.part.selling_price - sale.part.purchase_price
      total_profit = profit * sale.sale_quantity
      shipping_day = sale.shipping_day.strftime("%Y年%m月")
      data["day"] = shipping_day
      data["profit"] = total_profit
      datas << data
      data = {}
    end
    grouped_data = datas.group_by { |data| data["day"] }
    result_data = {}
    grouped_data.each_pair do |key, arr|
      sum = arr.inject(0) { |n, date| n + date['profit'] }
      result_data[key] = sum 
    end
    return result_data
  end

end
