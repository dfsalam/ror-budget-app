require 'rails_helper'

RSpec.describe ExpenseGroup, type: :model do  
  describe 'should not be blank.' do
    it 'Amount' do
      expense_group = ExpenseGroup.new(amount: nil)
      expect(expense_group).to_not be_valid
    end    
  end
end