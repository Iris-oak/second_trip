class AttractionsController < ApplicationController
   def index
        @q = Attraction.ransack(params[:q])
        @attractions = @q.result(distinct: true)

    end

    def visited
        @visited_attractions = current_user.visited_attractions.includes(:user)
    end
    


end
