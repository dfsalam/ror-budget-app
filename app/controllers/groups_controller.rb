class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  # GET /groups or /groups.json
  def index
    @title = 'CATEGORIES'
    return unless user_signed_in?

    @current_user = current_user
    @groups = Group.where(author_id: @current_user.id)
  end

  # GET /groups/new
  def new
    @title = 'ADD NEW CATEGORY'
    @current_user = current_user
    @group = Group.new
  end

  # POST /groups or /groups.json
  def create
    @current_user = current_user
    @author_id = @current_user.id
    @name = group_params[:name]
    @icon = group_params[:icon]
    @group = Group.new(author_id: @author_id, name: @name, icon: @icon)

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_url }
        format.json { render :show, status: :created, location: @group }
      else
        format.html do
          flash[:error] = @group.errors.full_messages.to_sentence
          redirect_to groups_path # Replace with the appropriate path for the new form
        end
        format.json { render json: @group.errors, status: :unprocessable_entity }

      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
