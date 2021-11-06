class VisitedsController < ApplicationController
    
   
    
    def create
        attraction = Attraction.find(params[:attraction_id])
        current_user.visited(attraction)
        redirect_back fallback_location: root_path, success: '変更しました'
    end
    
    def destroy
        attraction = current_user.visiteds.find(params[:id]).attraction
        current_user.unvisited(attraction)
        redirect_back fallback_location: root_path, success: '変更しました'
    end


    
end
