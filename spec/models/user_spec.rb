require 'rails_helper'

RSpec.describe User, type: :model do  
  describe 'Name' do
    it 'should not be blank.' do
      user = User.new(name: nil)
      expect(user).to_not be_valid
    end 
  end
end