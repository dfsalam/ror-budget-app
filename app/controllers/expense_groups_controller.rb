class ExpenseGroupsController < ApplicationController
  before_action :set_expense_group, only: %i[show edit update destroy]

  # GET /expense_groups or /expense_groups.json
  def index
    @title = 'TRANSACTIONS'
    @group = Group.find(params[:group_id])
    @expenses = ExpenseGroup.where(group_id: @group.id).order(created_at: :desc)
    @total_amount = ExpenseGroup.where(group_id: @group.id).sum(:amount)
  end

  # GET /expense_groups/1 or /expense_groups/1.json
  def show; end

  # GET /expense_groups/new
  def new
    @title = 'ADD NEW TRANSACTION'
    @expense_group = ExpenseGroup.new
    @group = Group.find(params[:group_id])
  end

  # GET /expense_groups/1/edit
  def edit; end

  # POST /expense_groups or /expense_groups.json
  def create
    @current_user = current_user
    group_id = expense_group_params[:g_id]
    @expense_group = ExpenseGroup.new(group_id:, amount: expense_group_params[:amount])

    @expense = @current_user.expenses.build(name: expense_group_params[:name])
    @expense.expense_groups << @expense_group

    respond_to do |format|
      if @expense.save
        format.html { redirect_to group_expense_groups_url(group_id)}
        format.json { render :show, status: :created, location: @expense }
      else
        format.html do
          flash[:error] = @expense_group.errors.full_messages.to_sentence
          redirect_to group_expense_groups_path(group_id)
        end
      end
    end
  end

  # PATCH/PUT /expense_groups/1 or /expense_groups/1.json
  def update
    respond_to do |format|
      if @expense_group.update(expense_group_params)
        format.html { redirect_to expense_group_url(@expense_group), notice: 'Expense group was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expense_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expense_groups/1 or /expense_groups/1.json
  def destroy
    @expense_group.destroy

    respond_to do |format|
      format.html { redirect_to expense_groups_url, notice: 'Expense group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense_group
    @expense_group = ExpenseGroup.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def expense_group_params
    params.require(:expense_group).permit(:amount, :expense_id, :name, :g_id)
  end
end
