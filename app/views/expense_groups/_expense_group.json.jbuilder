json.extract! expense_group, :id, :amount, :group_id, :expense_id, :created_at, :updated_at
json.url expense_group_url(expense_group, format: :json)
