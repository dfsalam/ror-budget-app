class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expense_groups, dependent: :destroy
  validates :name, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z]+\z/,
                                                                      message: 'only allows letters' }
  validates :icon, presence: true
end
