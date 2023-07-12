require 'rails_helper'

RSpec.describe 'Groups', type: :request do
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
  describe 'GET /index' do
    before(:each) do
      user.save
      group.save
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'renders index template' do
      get '/groups'
      expect(response).to render_template(:index)
    end
    it 'renders a successful response' do
      get '/groups'
      expect(response).to be_successful
    end

    it 'Test if /groups is loading correctly the body' do
      get '/groups'

      expect(response.body).to include('CATEGORIES')
      expect(response.body).to include('Name:')
      expect(response.body).to include('Total amount:')
    end

    it 'Test if /groups has the right group created' do
      get '/groups'
      expect(response.body).to include('Utilities')
    end

    it 'Test if the button ADD NEW CATEGORY is present' do
      get '/groups'
      expect(response.body).to include('ADD NEW CATEGORY')
    end
  end
end
