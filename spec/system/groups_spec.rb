require 'rails_helper'
RSpec.describe 'Groups', type: :system do  
  describe 'GET /index' do
    let(:user) do
      User.create!(
        name: 'Tom',
        email: 'test@mail.com',
        password: '123456'
      )
    end
    let(:group) do
      Group.create!(
        name: 'Utilities',
        icon: 'xxxxxxx',        
        user: :user
      )
    end
    let(:expense1) do
      Expense.create!(name: 'Electricity', author_id: user.id)
    end
    let(:expense2) do
      Expense.create!(name: 'Gas', author_id: user.id)
    end
    let(:expense3) do
      Expense.create!(name: 'Internet', author_id: user.id)
    end
    let(:g_Expenses1) { ExpenseGroup.create!(amount: 10, group_id: group.id, expense_id: expense1.id) }
    let(:g_Expenses2) { ExpenseGroup.create!(amount: 15, group_id: group.id, expense_id: expense2.id) }
    let(:g_Expenses3) { ExpenseGroup.create!(amount: 30, group_id: group.id, expense_id: expense3.id) }
    before(:each) do
      user.save
      group.save
      expense1.save
      expense2.save
      expense3.save
      g_Expenses1.save
      g_Expenses2.save
      g_Expenses3.save
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end
    it "Should display the group name." do
      visit "groups"
      expect(page).to have_content('Utilities')      
    end
    it "Should display the Expense's price." do
      visit "groups"
      expect(page).to have_content('Total amount: ')
    end    
  end
end
