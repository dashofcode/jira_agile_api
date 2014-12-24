module JiraAgileApi
  module Resources
    class Project
      include Virtus.model

      attribute :client

      attribute :id, Integer
      attribute :key, String
      attribute :name, String
    end
  end
end
