class UnknownsightSearch
    include ActiveModel::Model

    attr_accessor :visited_sightno, :search_sightname, :search_address

    def execute
        Sight.ransack(sightno_not_in: @visited_sightno, address_cont: @search_address).result
    end
end
