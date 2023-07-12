class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]

  # GET /expenses or /expenses.json
  def index
    @title = 'TRANSACTIONS'
    @group = Group.find(params[:group_id])
    @expenses = ExpenseGroup.where(group_id: @group.id).order(created_at: :desc)
  end

  # GET /expenses/new
  def new
    @title = 'ADD NEW CATEGORY'
    @expense = Expense.new
  end

  # POST /expenses or /expenses.json
  def create
    @current_user = current_user
    @expense = Expense.new(author_id: @current_user.id, name: expense_params[:name])
    @expense_group = ExpenseGroup.create(group_id: expense_params[:group_id], expense_id: @expense.id,
                                         amount: expense_params[:amount])

    respond_to do |format|
      if @expense.save
        format.html { redirect_to expense_url(@expense), notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_params
    params.require(:expense).permit(:name, :amount, :group_id)
  end
end
