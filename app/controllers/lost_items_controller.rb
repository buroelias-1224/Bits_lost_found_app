class LostItemsController < ApplicationController
  before_action :set_lost_item, only: %i[ show edit update destroy ]

  # GET /lost_items or /lost_items.json
  def index
    @lost_items = LostItem.all
  end

  # GET /lost_items/1 or /lost_items/1.json
  def show
  end

  # GET /lost_items/new
  def new
    @lost_item = LostItem.new
  end

  # GET /lost_items/1/edit
  def edit
  end

  # POST /lost_items or /lost_items.json
  def create
    @lost_item = LostItem.new(lost_item_params)

    respond_to do |format|
      if @lost_item.save
        format.html { redirect_to @lost_item, notice: "Lost item was successfully created." }
        format.json { render :show, status: :created, location: @lost_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lost_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lost_items/1 or /lost_items/1.json
  def update
    respond_to do |format|
      if @lost_item.update(lost_item_params)
        format.html { redirect_to @lost_item, notice: "Lost item was successfully updated." }
        format.json { render :show, status: :ok, location: @lost_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lost_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lost_items/1 or /lost_items/1.json
  def destroy
    @lost_item.destroy!

    respond_to do |format|
      format.html { redirect_to lost_items_path, status: :see_other, notice: "Lost item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lost_item
      @lost_item = LostItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def lost_item_params
      params.expect(lost_item: [ :title, :description, :location, :status, :user_id ])
    end
end
