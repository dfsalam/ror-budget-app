class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_groups, dependent: :destroy
  validates :name, presence: true  
end
