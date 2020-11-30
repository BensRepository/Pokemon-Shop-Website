class ProductToTrackersController < ApplicationController
  before_action :set_product_to_tracker, only: [:show, :edit, :update, :destroy]
  before_action :set_tracker, only: [:create]
  # GET /product_to_trackers
  # GET /product_to_trackers.json
  def index
    @product_to_trackers = ProductToTracker.all
  end

  # GET /product_to_trackers/1
  # GET /product_to_trackers/1.json
  def show
  end

  # GET /product_to_trackers/new
  def new
    @product_to_tracker = ProductToTracker.new
  end

  # GET /product_to_trackers/1/edit
  def edit
  end

  # POST /product_to_trackers
  # POST /product_to_trackers.json
  def create
    product = Product.find(params[:product_id])
    @product_to_tracker = @tracker.product_to_trackers.build(product: product)

    respond_to do |format|
      if @product_to_tracker.save
        format.html { redirect_to @product_to_tracker.tracker, notice: 'Product added to Trading Tracker' }
        format.json { render :show, status: :created, location: @product_to_tracker }
        format.js { flash[:notice] = 'Product added to Tracker'}
      else
        format.html { render :new }
        format.js { flash[:notice] = 'Product could not be added to Tracker'}
        format.json { render json: @product_to_tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_to_trackers/1
  # PATCH/PUT /product_to_trackers/1.json
  def update
    respond_to do |format|
      if @product_to_tracker.update(product_to_tracker_params)
        format.html { redirect_to @product_to_tracker, notice: 'Product to tracker was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_to_tracker }
      else
        format.html { render :edit }
        format.json { render json: @product_to_tracker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_to_trackers/1
  # DELETE /product_to_trackers/1.json
  def destroy
    @product_to_tracker.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Product to tracker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tracker
      @tracker = Tracker.find(session[:tracker_id])
    rescue ActiveRecord::RecordNotFound
      @tracker = Tracker.create
      session[:tracker_id] = @tracker.id
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_product_to_tracker
      @product_to_tracker = ProductToTracker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_to_tracker_params
      params.require(:product_to_tracker).permit(:product_id, :tracker_id)
    end
end
