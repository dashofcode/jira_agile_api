module JiraAgileApi
  module Resources
    class EstimateSum
      include Virtus.value_object

      values do
        attribute :value, Float
        attribute :text, String
      end
    end
  end
end
