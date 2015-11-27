module BucketlistSetter
  def set_bucketlist
    id = params[:bucketlist_id] || params[:id]
    @bucketlist = current_user.bucketlists.find_by_id(id)
    if @bucketlist.blank?
      msg = { error: "You dont have a bucket list with id:#{id}" }
      render json: msg, status: :unprocessable_entity
    end
  end
end
