class JemsController < ApplicationController
  # GET /jems
  # GET /jems.json
  def index
    @jems = Jem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jems }
    end
  end

  # GET /jems/1
  # GET /jems/1.json
  def show
    @jem = Jem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @jem }
    end
  end

  # GET /jems/new
  # GET /jems/new.json
  def new
    @jem = Jem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @jem }
    end
  end

  # GET /jems/1/edit
  def edit
    @jem = Jem.find(params[:id])
  end

  # POST /jems
  # POST /jems.json
  def create
    @jem = Jem.new(params[:jem])

    respond_to do |format|
      if @jem.save
        %x[bundle exec rails generate gemify #{@jem.id} RAILS_ENV=#{Rails.env.to_s}]
        # rails generate gemfying @jem.id
        format.html { redirect_to @jem, notice: 'Jem was successfully created.' }
        format.json { render json: @jem, status: :created, location: @jem }
      else
        format.html { render action: "new" }
        format.json { render json: @jem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jems/1
  # PUT /jems/1.json
  def update
    @jem = Jem.find(params[:id])

    respond_to do |format|
      if @jem.update_attributes(params[:jem])
        format.html { redirect_to @jem, notice: 'Jem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @jem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jems/1
  # DELETE /jems/1.json
  def destroy
    @jem = Jem.find(params[:id])
    @jem.destroy

    respond_to do |format|
      format.html { redirect_to jems_url }
      format.json { head :no_content }
    end
  end
end
