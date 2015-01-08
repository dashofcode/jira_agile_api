module JiraAgileApi
  module Resources
    class Epic < JiraAgileApi::Resources::Issue

      class Stats
        include Virtus.value_object

        values do
          attribute :notDoneEstimate, Float
          attribute :doneEstimate, Float
          attribute :estimated, Integer
          attribute :notEstimated, Integer
          attribute :notDone, Integer
          attribute :done, Integer
        end
      end

      attribute :epicLabel, String
      attribute :epicColour, String
      attribute :epicStats, JiraAgileApi::Resources::Epic::Stats
      attribute :issues, Array[JiraAgileApi::Resources::Issue], default: []
    end
  end
end
