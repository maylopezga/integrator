#require "serialport"


class AdmeafitsController < ApplicationController

  before_action :set_admeafit, only: [:show, :edit, :update, :destroy]


  # GET /admeafits
  # GET /admeafits.json
  #
  def tag
    #ban = true
    puts "entro"

    port_str = "/dev/ttyACM0"  #may be different for you
    baud_rate = 115200
    data_bits = 8
    stop_bits = 1
    parity = SerialPort::NONE

    sp = SerialPort.new(port_str, baud_rate, data_bits, stop_bits, parity)
  #  while ban do
      while (i = sp.gets.chomp) do
      	i.slice!("Tag is not NDEF formatted.")
      	tagUID = i
      	puts "el while"
        puts tagUID
        if tagUID.empty?
	         ban= true
	      else
          return tagUID
	      end



      end
    #end
  #sp.closes
 end



  def index
    @admeafits = Admeafit.all
  end

  # GET /admeafits/1
  # GET /admeafits/1.json
  def show
  end

  # GET /admeafits/new
  def new
    @admeafit = Admeafit.new
    @admeafit.code = tag
    @tutor = 'Efrain, Mayerli & Santiago'
    @bj = 'Zoi nueva'
  end

  # GET /admeafits/1/edit
  def edit
  end

  # POST /admeafits
  # POST /admeafits.json
  def create
    @admeafit = Admeafit.new(admeafit_params)

    respond_to do |format|
      if @admeafit.save
        format.html { redirect_to @admeafit, notice: 'Admeafit was successfully created.' }
        format.json { render :show, status: :created, location: @admeafit }
      else
        format.html { render :new }
        format.json { render json: @admeafit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admeafits/1
  # PATCH/PUT /admeafits/1.json
  def update
    respond_to do |format|
      if @admeafit.update(admeafit_params)
        format.html { redirect_to @admeafit, notice: 'Admeafit was successfully updated.' }
        format.json { render :show, status: :ok, location: @admeafit }
      else
        format.html { render :edit }
        format.json { render json: @admeafit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admeafits/1
  # DELETE /admeafits/1.json
  def destroy
    @admeafit.destroy
    respond_to do |format|
      format.html { redirect_to admeafits_url, notice: 'Admeafit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admeafit
      @admeafit = Admeafit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admeafit_params
      params.require(:admeafit).permit(:name, :code)

    end

end
