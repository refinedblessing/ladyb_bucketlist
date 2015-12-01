require "rails_helper"

RSpec.describe Api::V1::BucketlistsController, type: :controller do
  before do
    @user = FactoryGirl.create(:authenticated_user)
    token = AuthToken.encode(user_id: @user.id, email: @user.email)
    request.headers[:Authorization] = "#{token}"
    @bucketlist = FactoryGirl.attributes_for(:bucketlist)
    @edit_bucketlist = FactoryGirl.attributes_for(:bucketlist2)
    @invalid_bucket = FactoryGirl.attributes_for(:invalid_bucketlist)
  end

  describe "GET #index" do
    it "assigns all bucketlists of current user as @bucketlists" do
      bucketlist = Bucketlist.create! @bucketlist
      get :index
      expect(assigns(:bucketlists)).to eq([bucketlist])
    end

    it "assigns all bucketlists of current user that contain search term" do
      Bucketlist.create! @bucketlist
      bucketlist2 = Bucketlist.create! @edit_bucketlist
      params = { q: "b" }
      get :index, params
      expect(assigns(:bucketlists)).to eq([bucketlist2])
    end
  end

  describe "GET #show" do
    it "assigns the requested bucketlist as @bucketlist" do
      bucketlist = Bucketlist.create! @bucketlist
      get :show, id: bucketlist.to_param
      expect(assigns(:bucketlist)).to eq(bucketlist)
    end

    it "shows an error message for wrong bucketlist id" do
      Bucketlist.create! @bucketlist
      get :show, id: 15
      expect(json["bucketlist"]).to be nil
      expect(json).not_to be nil
      expect(json["error"]).to eq "You dont have a bucket list with id:15"
    end

    it "should not return a bucketlist when wrong id is entered" do
      bucketlist = Bucketlist.create! @bucketlist
      get :show, id: 15
      expect(assigns(:bucketlist)).not_to eq(bucketlist)
      expect(assigns(:bucketlist)).to be nil
    end

    it "should respond with a 422 for incorrect id" do
      get :show, id: 15
      expect(response.status).to eq 422
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Bucketlist" do
        post :create, @bucketlist
        expect(Bucketlist.all.count).to be 1
      end

      it "assigns a newly created bucketlist as @bucketlist" do
        post :create, @bucketlist
        expect(assigns(:bucketlist)).to be_a(Bucketlist)
        expect(assigns(:bucketlist)).to be_persisted
      end

      it "responds with 201 after creating bucketlist" do
        post :create, @bucketlist
        expect(response).to have_http_status 201
      end
    end

    context "with invalid params" do
      it "should not save bucketlist" do
        post :create, @invalid_bucket
        expect(assigns(:bucketlist)).not_to be_persisted
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested bucketlist" do
        bucketlist = Bucketlist.create! @bucketlist
        put :update, id: bucketlist.to_param, bucketlist: @edit_bucketlist
        bucketlist.reload
        expect(bucketlist.name).to eq "bucket"
      end

      it "assigns the requested bucketlist as @bucketlist" do
        bucketlist = Bucketlist.create! @bucketlist
        put :update, id: bucketlist.to_param, bucketlist: @bucketlist
        expect(assigns(:bucketlist)).to eq(bucketlist)
      end

      it "responds with a status of 200" do
        bucketlist = Bucketlist.create! @bucketlist
        put :update, id: bucketlist.to_param, bucketlist: @bucketlist
        expect(response).to have_http_status 200
      end
    end

    context "with invalid params" do
      it "retains the old bucketlist and responds with a 422" do
        bucketlist = Bucketlist.create! @bucketlist
        put :update, id: bucketlist.to_param, bucketlist: @invalid_bucket
        expect(assigns(:bucketlist)).to eq(bucketlist)
        expect(response).to have_http_status 422
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested bucketlist" do
      bucketlist = Bucketlist.create! @bucketlist
      expect(Bucketlist.all.count).to be 1
      delete :destroy, id: bucketlist.to_param
      expect(Bucketlist.all.count).to be 0
    end
  end
end
