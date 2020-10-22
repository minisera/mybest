class PostcsController < ApplicationController
  before_action :set_postc, only: [:show, :edit, :update, :destroy]

  # GET /postcs
  # GET /postcs.json
  def index
    @postcs = Postc.all
  end

  # GET /postcs/1
  # GET /postcs/1.json
  def show
  end

  # GET /postcs/new
  def new
    @postc = Postc.new
  end

  # GET /postcs/1/edit
  def edit
  end

  # POST /postcs
  # POST /postcs.json
  def create
    @postc = Postc.new(postc_params)

    respond_to do |format|
      if @postc.save
        format.html { redirect_to @postc, notice: 'Postc was successfully created.' }
        format.json { render :show, status: :created, location: @postc }
      else
        format.html { render :new }
        format.json { render json: @postc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /postcs/1
  # PATCH/PUT /postcs/1.json
  def update
    respond_to do |format|
      if @postc.update(postc_params)
        format.html { redirect_to @postc, notice: 'Postc was successfully updated.' }
        format.json { render :show, status: :ok, location: @postc }
      else
        format.html { render :edit }
        format.json { render json: @postc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /postcs/1
  # DELETE /postcs/1.json
  def destroy
    @postc.destroy
    respond_to do |format|
      format.html { redirect_to postcs_url, notice: 'Postc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_postc
      @postc = Postc.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def postc_params
      params.require(:postc).permit(:title, :story)
    end
end
