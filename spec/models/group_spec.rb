require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'The group returns correct name and icon.' do
    let(:user) { User.new(name: 'Diego', email: 'test@test.com') }
    let(:group) { Group.new(name: 'Utilities', icon:'asdfg', author_id:user.id)}    
    it 'the group has the correct name' do
      expect(group.name).to eq('Utilities')
    end
    it 'the group has the correct icon' do
      expect(group.icon).to eq('asdfg')
    end

  end
  describe 'should not be blank.' do
    let(:user) { User.new(name: 'Diego', email: 'test@test.com') }
    let(:group) { Group.new(name: nil, icon:'asdfg', author_id:user.id)}
    it 'Name' do      
      expect(group).to_not be_valid
    end
  end
  describe 'should not be blank' do
    let(:user) { User.new(name: 'Diego', email: 'test@test.com') }
    let(:group) { Group.new(name: 'Utilities', icon: nil, author_id:user.id)}
    it 'Icon' do     
      expect(group).to_not be_valid
    end   
  end
end