class Order < ActiveRecord::Base

  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  # after_save: send_order_confirmation



  # def send_order_confirmation
    
  #   end
end
