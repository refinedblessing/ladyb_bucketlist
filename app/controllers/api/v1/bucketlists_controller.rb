class Api::V1::BucketlistsController < ApplicationController
  before_action :set_bucketlist, only: [:show, :update, :destroy]

  # GET /bucketlists.json
  def index
    @bucketlists = Bucketlist.all

    render json: @bucketlists
  end

  # GET /bucketlists/1.json
  def show
    render json: @bucketlist
  end

  # POST /bucketlists.json
  def create
    @bucketlist = Bucketlist.new(bucketlist_params)
    if @bucketlist.save
      render json: @bucketlist, status: :created, location: @bucketlist
    else
      render json: @bucketlist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bucketlists/1.json
  def update
    @bucketlist = Bucketlist.find(params[:id])
    if @bucketlist.update(bucketlist_params)
      head :no_content
    else
      render json: @bucketlist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bucketlists/1.json
  def destroy
    @bucketlist.destroy

    head :no_content
  end

  private
    def set_bucketlist
      @bucketlist = Bucketlist.find(params[:id])
    end

    def bucketlist_params
      params.require(:bucketlist).permit(:name, :created_by)
    end
end
