class LikesController < ApplicationController

    def create
      @like = Like.new
      @like.user_id = current_user.id
      @like.photo_id = params[:photo_id]
      if @like.save
            flash[:success] = "LIKE добавлен"
            redirect_to "/photos/#{@like.photo_id}"
      end
    end

    def destroy
      @like =  Like.destroy(params[:id])
      redirect_to "/photos/#{@like.photo_id}"

    end


end
