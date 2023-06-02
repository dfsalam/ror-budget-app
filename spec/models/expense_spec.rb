require 'rails_helper'

RSpec.describe Expense, type: :model do  
  describe 'should not be blank.' do
    it 'Name' do
      expense = Expense.new(name: nil)
      expect(expense).to_not be_valid
    end    
  end
end