# Items controller for carrying out CRUD operations on Item Model
module Api
  module V1
    class ItemsController < ApplicationController
      before_action :set_item, only: [:show, :update, :destroy]

      # GET /items.json
      def index
        @items = Item.where(bucketlist_id: params[:bucketlist_id])
        @items = @items.completed if params[:done] == "true"
        @items = @items.uncompleted if params[:done] == "false"
        if stale?(etag: @items.all,
                  last_modified: @items.maximum(:updated_at))
          render json: @items
        end
      end

      # GET /items/1.json
      def show
        @item = @item = Item.find(params[:id])
        render json: @item if stale? @item
      end

      # POST /items.json
      def create
        @item = Item.create(name: params[:name], done: false,
                            bucketlist_id: params[:bucketlist_id])

        if @item.save
          render json: @item, status: :created
        else
          render json: @item.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /items/1.json
      def update
        @item = Item.find(params[:id])
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
        @item = Item.where(bucketlist_id: params[:bucketlist_id],
                           id: params[:id])[0]
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
