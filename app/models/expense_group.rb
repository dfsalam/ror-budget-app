class ExpenseGroup < ApplicationRecord
  belongs_to :group
  belongs_to :expense
  validates :amount, presence: true, comparison: { greater_than: 0 }
end
