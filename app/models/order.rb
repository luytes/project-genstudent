class Order < ApplicationRecord
  monetize :amount_pennies
  belongs_to :service, optional: true
end
