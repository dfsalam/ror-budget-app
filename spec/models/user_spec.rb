require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'The user returns correct name and email.' do
    let(:user) { User.new(name: 'Diego', email: 'test@test.com') }
    it 'the User has the correct name' do
      expect(user.name).to eq('Diego')
    end
    it 'returns User has the correct email' do
      expect(user.email).to eq('test@test.com')
    end
  end
  describe 'Name' do
    let(:user) { User.new(name: nil, email: 'test@test.com') }
    it 'should not be blank.' do     
      expect(user).to_not be_valid
    end 
  end
end