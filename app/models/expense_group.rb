class ExpenseGroup < ApplicationRecord
  belongs_to :groups
  belongs_to :expenses
  validates :amount, presence: true
end
