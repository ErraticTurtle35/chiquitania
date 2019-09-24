class StockMovesController < ApplicationController
  before_action :set_stock_move, only: [:show, :edit, :update, :destroy]

  # GET /stock_moves
  # GET /stock_moves.json
  def index
    @stock_moves = StockMove.all
  end

  # GET /stock_moves/1
  # GET /stock_moves/1.json
  def show
  end

  # GET /stock_moves/new
  def new
    @stock_move = StockMove.new
  end

  # GET /stock_moves/1/edit
  def edit
  end

  # POST /stock_moves
  # POST /stock_moves.json
  def create
    @stock_move = StockMove.new(stock_move_params)

    respond_to do |format|
      if @stock_move.save
        format.html { redirect_to @stock_move, notice: 'Stock move was successfully created.' }
        format.json { render :show, status: :created, location: @stock_move }
      else
        format.html { render :new }
        format.json { render json: @stock_move.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_moves/1
  # PATCH/PUT /stock_moves/1.json
  def update
    respond_to do |format|
      if @stock_move.update(stock_move_params)
        format.html { redirect_to @stock_move, notice: 'Stock move was successfully updated.' }
        format.json { render :show, status: :ok, location: @stock_move }
      else
        format.html { render :edit }
        format.json { render json: @stock_move.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_moves/1
  # DELETE /stock_moves/1.json
  def destroy
    @stock_move.destroy
    respond_to do |format|
      format.html { redirect_to stock_moves_url, notice: 'Stock move was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_move
      @stock_move = StockMove.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stock_move_params
      params.require(:stock_move).permit(:product_name, :product_id, :date, :move_description, :uom_name, :quantity, :product_cost)
    end
end
