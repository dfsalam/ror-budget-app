json.extract! expense, :id, :name, :created_at, :updated_at
json.url expense_url(expense, format: :json)
