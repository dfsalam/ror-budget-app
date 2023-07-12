class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :expenses, foreign_key: 'author_id'
  has_many :groups, foreign_key: 'author_id'

  validates :name, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z\s]+\z/,
                                                                      message: 'only allows letters' }
end
