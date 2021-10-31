class HistorySearch
    include ActiveModel::Model

    attr_accessor :search_userid, :visited_sightno

    def execute
        History.ransack(userid_eq: @search_userid).result
    end
end