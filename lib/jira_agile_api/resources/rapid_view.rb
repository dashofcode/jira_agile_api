module JiraAgileApi
  module Resources
    class RapidView
      include Virtus.model

      attribute :client

      attribute :id, Integer
      attribute :name, String
      attribute :canEdit, Boolean
      attribute :sprintSupportEnabled, Boolean
    end
  end
end
