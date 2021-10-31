class VisitedsController < ApplicationController
    
    def new
    end

    def attraction_search
        attraction_search = AttractionsController.new(params_checkin)
        @attraction = attraction_search.checkin
    end

    def index

        # loginuserIDの履歴を取得
        history_search = HistorySearch.new(loginuserID)
        @histories = history_search.execute
    
        # ユーザーの履歴にあるsightnoを渡して、訪問済以外の観光地を検索
        unknownsight_search = UnknownsightSearch.new(@histories.sightno, params_unknown_search)
        @unknownsights = unknownsight_search.execute
        gon.unknownsights = @unknownsights
    end
    
    private
    
    def params_unknownsight_search
        params.permit(:search_address)
    end
    
end
