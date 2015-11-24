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
        render json: @items
      end

      # GET /items/1.json
      def show
        render json: @item
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
        @item = Item.find_by_id(params[:id])
        if @item.blank?
          msg = { error: "Item with id:#{params[:id]} does not exist" }
          render json: msg, status: :unprocessable_entity
        end
      end

      def item_params
        params.require(:item).permit(:name, :done)
      end
    end
  end
end
