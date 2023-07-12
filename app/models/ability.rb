class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all
    can :create, :all
    can :destroy, Group do |group|
      group.user == user
    end

    can :destroy, Expense do |expense|
      expense.user == user
    end

    can :destroy, ExpenseGroup do |expense_group|
      expense_group.user == user
    end

    return unless user.role == 'admin'

    can :manage, :all
  end
end
