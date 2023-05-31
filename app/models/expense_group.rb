class ExpenseGroup < ApplicationRecord
  belongs_to :group
  belongs_to :expense
end
