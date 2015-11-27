# In charge of handling CRUD actions on the Bucketlist model
module Api
  module V1
    class BucketlistsController < ApplicationController
      before_action :authenticate
      before_action :set_bucketlist, only: [:show, :update, :destroy]

      # GET /bucketlists.json
      def index
        paginater
        @bucketlists = current_user.bucketlists.with_items
        @bucketlists = @bucketlists.search(params[:q]) if params[:q]
        @bucketlists = @bucketlists.limit(@limit).offset(@offset)
        if stale?(etag: @bucketlists,
                  last_modified: @bucketlists.maximum(:updated_at))
          render json: @bucketlists
        end
      end

      # GET /bucketlists/1.json
      def show
        render json: @bucketlist if stale? @bucketlist
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

      def bucketlist_params
        params.require(:bucketlist).permit(:name)
      end

      def paginater
        @limit = params[:limit].to_i
        @limit = 20 if @limit < 1
        @page = params[:page].to_i
        @page = 1 if @page < 1
        @offset = @limit * (@page - 1)
      end
    end
  end
end
