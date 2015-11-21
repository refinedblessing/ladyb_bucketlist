require "rails_helper"

RSpec.describe Api::V1::BucketlistsController, type: :controller do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BucketlistsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all bucketlists as @bucketlists" do
      bucketlist = Bucketlist.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:bucketlists)).to eq([bucketlist])
    end
  end

  describe "GET #show" do
    it "assigns the requested bucketlist as @bucketlist" do
      bucketlist = Bucketlist.create! valid_attributes
      get :show, {id: bucketlist.to_param}, valid_session
      expect(assigns(:bucketlist)).to eq(bucketlist)
    end
  end
  describe "POST #create" do
    context "with valid params" do
      it "creates a new Bucketlist" do
        expect {
          post :create, {bucketlist: valid_attributes}, valid_session
        }.to change(Bucketlist, :count).by(1)
      end

      it "assigns a newly created bucketlist as @bucketlist" do
        post :create, {bucketlist: valid_attributes}, valid_session
        expect(assigns(:bucketlist)).to be_a(Bucketlist)
        expect(assigns(:bucketlist)).to be_persisted
      end

      it "redirects to the created bucketlist" do
        post :create, {bucketlist: valid_attributes}, valid_session
        expect(response).to redirect_to(Bucketlist.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved bucketlist as @bucketlist" do
        post :create, {bucketlist: invalid_attributes}, valid_session
        expect(assigns(:bucketlist)).to be_a_new(Bucketlist)
      end

      it "re-renders the 'new' template" do
        post :create, {bucketlist: invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested bucketlist" do
        bucketlist = Bucketlist.create! valid_attributes
        put :update, {id: bucketlist.to_param, bucketlist: new_attributes}, valid_session
        bucketlist.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested bucketlist as @bucketlist" do
        bucketlist = Bucketlist.create! valid_attributes
        put :update, {id: bucketlist.to_param, bucketlist: valid_attributes}, valid_session
        expect(assigns(:bucketlist)).to eq(bucketlist)
      end

      it "redirects to the bucketlist" do
        bucketlist = Bucketlist.create! valid_attributes
        put :update, {id: bucketlist.to_param, bucketlist: valid_attributes}, valid_session
        expect(response).to redirect_to(bucketlist)
      end
    end

    context "with invalid params" do
      it "assigns the bucketlist as @bucketlist" do
        bucketlist = Bucketlist.create! valid_attributes
        put :update, {id: bucketlist.to_param, bucketlist: invalid_attributes}, valid_session
        expect(assigns(:bucketlist)).to eq(bucketlist)
      end

      it "re-renders the 'edit' template" do
        bucketlist = Bucketlist.create! valid_attributes
        put :update, {id: bucketlist.to_param, bucketlist: invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested bucketlist" do
      bucketlist = Bucketlist.create! valid_attributes
      expect {
        delete :destroy, {id: bucketlist.to_param}, valid_session
      }.to change(Bucketlist, :count).by(-1)
    end

    it "redirects to the bucketlists list" do
      bucketlist = Bucketlist.create! valid_attributes
      delete :destroy, {id: bucketlist.to_param}, valid_session
      expect(response).to redirect_to(bucketlists_url)
    end
  end

end
