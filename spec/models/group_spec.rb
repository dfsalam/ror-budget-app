require 'rails_helper'

RSpec.describe Group, type: :model do  
  describe 'should not be blank.' do
    it 'Name' do
      group = Group.new(name: nil, icon:'qqq')
      expect(group).to_not be_valid
    end
    it 'Icon' do
      group = Group.new(name: 'qqq', icon: nil)
      expect(group).to_not be_valid
    end   
  end
end