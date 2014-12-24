module JiraAgileApi
  module Resources
    class StatFieldValue
      include Virtus.value_object

      values do
        attribute :value, Float
        attribute :text, String
      end
    end

    class EstimateStatistic
      include Virtus.value_object

      values do
        attribute :statFieldId, String
        attribute :statFieldValue, JiraAgileApi::Resources::StatFieldValue
      end

      def value
        statFieldValue.value
      end
    end
  end
end
