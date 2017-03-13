class HomeController < ApplicationController
  before_action :authenticate_user!
  def index

    @people = current_user.following
    @people.map do |person|
       person.id
     end


     @photos = Photo.where(user_id: @people)
  end
end
