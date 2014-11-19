module JiraAgileApi
  module Resources
    class EstimateStatistic
      include Virtus.model

      attribute :client

      attribute :statFieldId, String
      attribute :statFieldValue, Float
      attribute :statFieldText, String
    end
  end
end
