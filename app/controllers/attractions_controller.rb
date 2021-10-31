class AttractionsController < ApplicationController
   def index
        @q = Attraction.ransack(params[:q])
        @attractions = @q.result(distinct: true)

    end

    def move
        redirect_to("/visited/#{params[:id]}")
    end

end
