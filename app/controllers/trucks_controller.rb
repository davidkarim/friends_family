class TrucksController < ApplicationController
  before_action :set_truck, only: [:show, :edit, :update, :destroy]

  # GET /trucks
  # GET /trucks.json
  def index
    @trucks = Truck.all
    # @locations = Location.all
  end

  # GET /trucks/1
  # GET /trucks/1.json
  def show
    @truck_owner = @truck.truck_owner
  end

  # GET /trucks/new
  def new
    @truck = Truck.new
  end

  # GET /trucks/1/edit
  def edit

  end

  # POST /trucks
  # POST /trucks.json
  def create
    #truck_params.merge!("truck_owner_id" => current_user.id) --- see below
    #binding.pry
    @truck = current_user.trucks.new(truck_params)
    @file = params[:truck][:picture]
    extension = file_extension @file.original_filename
    filename = @truck.name.downcase.gsub(' ', '-') + "-" + current_user.id.to_s + "-" + Time.now.to_s.downcase.gsub(' ', '-').slice(0..-7) + extension
    @truck.image_url = "https://s3.amazonaws.com/food-trucks/#{filename}"
    #binding.pry
    #binding.pry
    s3 = Aws::S3::Resource.new(region:'us-east-1')
    obj = s3.bucket('food-trucks').object(filename)
    obj.upload_file(@file.tempfile)

    respond_to do |format|
      if @truck.save
        format.html { redirect_to @truck, notice: 'Truck was successfully created.' }
        format.json { render :show, status: :created, location: @truck }
      else
        format.html { render :new }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  def file_extension(full_file_name)
    extension = full_file_name.slice(-4..-1)
    if extension == ".jpg" || extension == "jpeg"
      return ".jpg"
    elsif extension == ".gif"
      return ".gif"
    elsif extension == ".png"
      return ".png"
    else
      return ""
    end
  end

  # PATCH/PUT /trucks/1
  # PATCH/PUT /trucks/1.json
  def update
    respond_to do |format|
      if @truck.update(truck_params)
        format.html { redirect_to @truck, notice: 'Truck was successfully updated.' }
        format.json { render :show, status: :ok, location: @truck }
      else
        format.html { render :edit }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.json
  def destroy
    @truck.destroy
    respond_to do |format|
      format.html { redirect_to trucks_url, notice: 'Truck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_truck
      @truck = Truck.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def truck_params
      params.require(:truck).permit(:name, :web_url, :phone_number)
    end
end
