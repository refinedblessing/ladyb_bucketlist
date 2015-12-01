# Items controller for carrying out CRUD operations on Item Model
module Api
  module V1
    class ItemsController < ApplicationController
      before_action :set_bucketlist
      before_action :set_item, only: [:show, :update, :destroy]

      # GET /items.json
      def index
        @items = @bucketlist.items
        @items = @items.completed if params[:done] == "true"
        @items = @items.uncompleted if params[:done] == "false"
        if stale?(etag: @items,
                  last_modified: @items.maximum(:updated_at))
          render json: @items
        end
      end

      # GET /items/1.json
      def show
        @item = @bucketlist.items.find_by_id(params[:id])
        if stale?(etag: @item, last_modified: @item.updated_at)
          render json: @item
        end
      end

      # POST /items.json
      def create
        @item = @bucketlist.items.create(name: params[:name], done: false)

        if @item.save
          render json: @item, status: :created
        else
          render json: @item.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /items/1.json
      def update
        @item = @bucketlist.items.find_by_id(params[:id])
        if @item.update(item_params)
          render json: @item, status: 200
        else
          render json: @item.errors, status: :unprocessable_entity
        end
      end

      # DELETE /items/1.json
      def destroy
        @item.destroy
        head :no_content
      end

      private

      def set_item
        @item = @bucketlist.items.find_by_id(params[:id])
        if @item.blank?
          msg = "Item with id:#{params[:id]} doesnt exist in this bucketlist"
          msg = { error: msg }
          render json: msg, status: :unprocessable_entity
        end
      end

      def item_params
        params.require(:item).permit(:name, :done)
      end
    end
  end
end
