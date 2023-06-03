require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'The expense returns correct name' do
    let(:user) { User.new(name: 'Diego', email: 'test@test.com') }
    let(:group) { Group.new(name: 'Utilities', icon:'asdfg', author_id:user.id)}    
    let(:expense) {Expense.new(name: 'Electricity', author_id:user.id)}
    it 'the group has the correct name' do
      expect(expense.name).to eq('Electricity')
    end
  end
  describe 'should not be blank.' do
    let(:user) { User.new(name: 'Diego', email: 'test@test.com') }
    let(:group) { Group.new(name: nil, icon:'asdfg', author_id:user.id)}
    let(:expense) {Expense.new(name: nil, author_id:user.id)}
    it 'Name' do      
      expect(expense).to_not be_valid
    end
  end  
end