require 'rails_helper'

RSpec.describe 'Expense_groups', type: :request do
  let(:user) do
    User.create!(
      name: 'Tom',
      email: 'test@mail.com',
      password: '123456'
    )
  end
  let(:group) do
    Group.create!(
      name: 'Utilities', icon: 'asdfg', author_id: user.id
    )
  end
  let(:expense1) do
    Expense.create!(
      name: 'Electricity', author_id: user.id
    )
  end
  let(:expense2) do
    Expense.create!(
      name: 'Gas', author_id: user.id
    )
  end
  let(:expense_group1) do
    ExpenseGroup.create!(
      amount: 15, group_id: group.id, expense_id: expense1.id
    )
  end
  let(:expense_group2) do
    ExpenseGroup.create!(
      amount: 10, group_id: group.id, expense_id: expense2.id
    )
  end

  describe 'GET /index' do
    before(:each) do
      user.save
      group.save
      expense1.save
      expense2.save
      expense_group1.save
      expense_group2.save
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'renders index template' do
      get "/groups/#{group.id}/expense_groups"
      expect(response).to render_template(:index)
    end
    it 'renders a successful response' do
      get "/groups/#{group.id}/expense_groups"
      expect(response).to be_successful
    end

    it 'Test if is loading correctly the body' do
      get "/groups/#{group.id}/expense_groups"

      expect(response.body).to include('TRANSACTIONS')
      expect(response.body).to include('Amount:')
      expect(response.body).to include('Category:')
    end

    it 'Test if Utilities is present also the correct total amount' do
      get "/groups/#{group.id}/expense_groups"
      expect(response.body).to include('Utilities')
      expect(response.body).to include('Total amount: $25.0')
    end

    it 'Test if the button ADD NEW TRANSACTION is present' do
      get "/groups/#{group.id}/expense_groups"
      expect(response.body).to include('ADD NEW TRANSACTION')
    end
  end
end
