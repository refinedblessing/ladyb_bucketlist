# In charge of handling CRUD actions on the Bucketlist model
module Api
  module V1
    class BucketlistsController < ApplicationController
      before_action :authenticate
      before_action :set_bucketlist, only: [:show, :update, :destroy]

      # GET /bucketlists.json
      def index
        @bucketlists = current_user.bucketlists
        @bucketlists = @bucketlists.search(params[:q]) if params[:q]
        render json: @bucketlists
      end

      # GET /bucketlists/1.json
      def show
        render json: @bucketlist
      end

      # POST /bucketlists.json
      def create
        @bucketlist = Bucketlist.create(name: params[:name],
                                        created_by: current_user.id)
        if @bucketlist.save
          render json: @bucketlist, status: :created
        else
          render json: @bucketlist.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /bucketlists/1.json
      def update
        @bucketlist = Bucketlist.find(params[:id])
        if @bucketlist.update(bucketlist_params)
          render json: @bucketlist, status: 200
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
        @bucketlist = Bucketlist.find_by_id(params[:id])
        if @bucketlist.blank?
          msg = { error: "Bucket list with id:#{params[:id]} does not exist" }
          render json: msg, status: :unprocessable_entity
        end
      end

      def bucketlist_params
        params.require(:bucketlist).permit(:name)
      end
    end
  end
end
