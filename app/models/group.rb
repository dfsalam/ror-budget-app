class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_groups, dependent: :destroy
end
