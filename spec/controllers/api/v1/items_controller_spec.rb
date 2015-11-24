require "rails_helper"

RSpec.describe Api::V1::ItemsController, type: :controller do
  before do
    @user = FactoryGirl.create(:authenticated_user)
    token = AuthToken.encode(user_id: @user.id, email: @user.email)
    request.headers[:Authorization] = "#{token}"
    @bucketlist = FactoryGirl.create(:bucketlist)
    @edit_bucketlist = FactoryGirl.create(:bucketlist2)
    @valid_attributes = FactoryGirl.attributes_for(:item)
    @invalid_attribute = FactoryGirl.attributes_for(:invalid_item)
    @new_attributes = FactoryGirl.attributes_for(:true_item)
  end

  describe "GET #index" do
    it "assigns all items as @items" do
      item = Item.create! @valid_attributes
      item2 = Item.create! @new_attributes
      get :index, bucketlist_id: @bucketlist.id
      expect(assigns(:items)).to eq([item, item2])
    end

    it "returns only done items when params[done] is true" do
      Item.create! @valid_attributes
      item2 = Item.create! @new_attributes
      params = { done: "true", bucketlist_id: @bucketlist.id }
      get :index, params
      expect(assigns(:items)).to eq([item2])
    end

    it "returns only done items when params[done] is true" do
      item = Item.create! @valid_attributes
      Item.create! @new_attributes
      params = { done: "false", bucketlist_id: @bucketlist.id }
      get :index, params
      expect(assigns(:items)).to eq([item])
    end
  end

  describe "GET #show" do
    it "assigns the requested item as @item" do
      item = Item.create! @valid_attributes
      get :show, bucketlist_id: @bucketlist.id, id: item.to_param
      expect(assigns(:item)).to eq(item)
    end

    it "shows an error message for wrong item id" do
      get :show, bucketlist_id: @bucketlist.id, id: 15
      expect(json["item"]).to be nil
      expect(json["error"]).to eq "Item with id:15 does not exist"
    end

    it "should not return an item when wrong id is entered" do
      item = Item.create! @valid_attributes
      get :show, bucketlist_id: @bucketlist.id, id: 15
      expect(assigns(:item)).not_to eq(item)
    end

    it "should respond with a 422 for incorrect id" do
      item = Item.create! @valid_attributes
      get :show, bucketlist_id: @bucketlist.id, id: 15
      expect(assigns(:item)).not_to eq(item)
      expect(response.status).to eq 422
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Item" do
        post :create, bucketlist_id: @bucketlist.id
        expect(Bucketlist.all.count).not_to be 0
      end

      it "assigns a newly created item as @item" do
        params = @valid_attributes
        post :create, params
        expect(assigns(:item)).to be_a(Item)
        expect(assigns(:item)).to be_persisted
      end

      it "redirects to the created item" do
        params = @valid_attributes
        post :create, params
        expect(response.status).to be 201
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested item" do
        item = Item.create! @valid_attributes
        put :update, id: item.id,
                     item: @new_attributes, bucketlist_id: @bucketlist.id
        item.reload
        expect(item.done).to be true
      end

      it "assigns the requested item as @item" do
        item = Item.create! @valid_attributes
        put :update, id: item.id,
                     item: @valid_attributes, bucketlist_id: @bucketlist.id
        expect(assigns(:item)).to eq(item)
      end

      it "should respond with ok status" do
        item = Item.create! @valid_attributes
        put :update, id: item.id,
                     item: @valid_attributes, bucketlist_id: @bucketlist.id
        expect(response.status).to be 200
      end
    end

    context "with invalid params" do
      it "assigns the item as @item" do
        item = Item.create! @valid_attributes
        put :update, id: item.id,
                     item: @invalid_attribute, bucketlist_id: @bucketlist.id
        expect(assigns(:item)).to eq(item)
        expect(response.status).to eq 422
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested item" do
      item = Item.create! @valid_attributes
      expect(Item.all.count).to eq 1
      delete :destroy, id: item.id, bucketlist_id: @bucketlist.id
      expect(Item.all.count).to eq 0
    end
  end
end
