module JiraAgileApi
  module Resources
    class Version
      include Virtus.model

      class Stats
        include Virtus.value_object

        values do
          attribute :notDoneEstimate, Float
          attribute :doneEstimate, Float
          attribute :totalEstimate, Float
          attribute :percentageCompleted, Float
          attribute :estimated, Integer
          attribute :percentageEstimated, Float
          attribute :notEstimated, Integer
          attribute :percentageUnestimated, Float
          attribute :notDone, Integer
          attribute :done, Integer
          attribute :totalIssueCount, Integer
        end
      end

      attribute :client

      attribute :id, Integer
      attribute :name, String
      attribute :sequence, Integer, default: 0
      attribute :released, Boolean, default: false
      attribute :releaseDate, DateTime
      attribute :releaseDateFormatted, String
      attribute :versionStats, JiraAgileApi::Resources::Version::Stats
    end
  end
end
