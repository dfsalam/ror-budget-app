require "application_system_test_case"

class ExpenseGroupsTest < ApplicationSystemTestCase
  setup do
    @expense_group = expense_groups(:one)
  end

  test "visiting the index" do
    visit expense_groups_url
    assert_selector "h1", text: "Expense groups"
  end

  test "should create expense group" do
    visit expense_groups_url
    click_on "New expense group"

    fill_in "Amount", with: @expense_group.amount
    fill_in "Expense", with: @expense_group.expense_id
    fill_in "Group", with: @expense_group.group_id
    click_on "Create Expense group"

    assert_text "Expense group was successfully created"
    click_on "Back"
  end

  test "should update Expense group" do
    visit expense_group_url(@expense_group)
    click_on "Edit this expense group", match: :first

    fill_in "Amount", with: @expense_group.amount
    fill_in "Expense", with: @expense_group.expense_id
    fill_in "Group", with: @expense_group.group_id
    click_on "Update Expense group"

    assert_text "Expense group was successfully updated"
    click_on "Back"
  end

  test "should destroy Expense group" do
    visit expense_group_url(@expense_group)
    click_on "Destroy this expense group", match: :first

    assert_text "Expense group was successfully destroyed"
  end
end
