# require "rails_helper"
#
# RSpec.describe Api::V1::BucketlistsController, type: :controller do
#   let(:valid_attributes) { FactoryGirl.attributes_for(:bucketlist) }
#
#   let(:invalid_attributes) { FactoryGirl.attributes_for(:invalid_bucketlist) }
#
#   # This should return the minimal set of values that should be in the session
#   # in order to pass any filters (e.g. authentication) defined in
#   # BucketlistsController. Be sure to keep this updated too.
#   let(:valid_session) { {} }
#
#   describe "GET #index" do
#     it "assigns all bucketlists as @bucketlists" do
#       bucketlist = Bucketlist.create! valid_attributes
#       get :index, {}, valid_session
#       expect(assigns(:bucketlists)).to eq([bucketlist])
#     end
#   end
#
#   describe "GET #show" do
#     it "assigns the requested bucketlist as @bucketlist" do
#       bucketlist = Bucketlist.create! valid_attributes
#       get :show, {id: bucketlist.to_param}, valid_session
#       expect(assigns(:bucketlist)).to eq(bucketlist)
#     end
#   end
#   describe "POST #create" do
#     context "with valid params" do
#       it "creates a new Bucketlist" do
#         expect {
#           post :create, {bucketlist: valid_attributes}, valid_session
#         }.to change(Bucketlist, :count).by(1)
#       end
#
#       it "assigns a newly created bucketlist as @bucketlist" do
#         post :create, {bucketlist: valid_attributes}, valid_session
#         expect(assigns(:bucketlist)).to be_a(Bucketlist)
#         expect(assigns(:bucketlist)).to be_persisted
#       end
#
#       it "redirects to the created bucketlist" do
#         post :create, {bucketlist: valid_attributes}, valid_session
#         expect(response).to have_http_status 201
#       end
#     end
#
#     context "with invalid params" do
#       it "assigns a newly created but unsaved bucketlist as @bucketlist" do
#         post :create, {bucketlist: invalid_attributes}, valid_session
#         expect(assigns(:bucketlist)).to be_a_new(Bucketlist)
#       end
#     end
#   end
#
#   describe "PUT #update" do
#     context "with valid params" do
#       let(:new_attributes) { FactoryGirl.attributes_for(:bucketlist2) }
#
#       it "updates the requested bucketlist" do
#         bucketlist = Bucketlist.create! valid_attributes
#         put :update, {id: bucketlist.to_param, bucketlist: new_attributes}, valid_session
#         bucketlist.reload
#         expect(bucketlist.name).to eq "bucket"
#       end
#
#       it "assigns the requested bucketlist as @bucketlist" do
#         bucketlist = Bucketlist.create! valid_attributes
#         put :update, {id: bucketlist.to_param, bucketlist: valid_attributes}, valid_session
#         expect(assigns(:bucketlist)).to eq(bucketlist)
#       end
#
#       it "redirects to the bucketlist" do
#         bucketlist = Bucketlist.create! valid_attributes
#         put :update, {id: bucketlist.to_param, bucketlist: valid_attributes}, valid_session
#         expect(response).to have_http_status 204
#       end
#     end
#
#     context "with invalid params" do
#       it "assigns the bucketlist as @bucketlist" do
#         bucketlist = Bucketlist.create! valid_attributes
#         put :update, {id: bucketlist.to_param, bucketlist: invalid_attributes}, valid_session
#         expect(assigns(:bucketlist)).to eq(bucketlist)
#       end
#     end
#   end
#
#   describe "DELETE #destroy" do
#     it "destroys the requested bucketlist" do
#       bucketlist = Bucketlist.create! valid_attributes
#       expect {
#         delete :destroy, {id: bucketlist.to_param}, valid_session
#       }.to change(Bucketlist, :count).by(-1)
#     end
#   end
#
# end
