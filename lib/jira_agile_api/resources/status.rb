module JiraAgileApi
  module Resources
    class Status
      include Virtus.value_object

      class Category
        include Virtus.value_object

        values do
          attribute :id, String
          attribute :key, String
          attribute :colorName, String
        end
      end

      values do
        attribute :id, String
        attribute :name, String
        attribute :description, String
        attribute :iconUrl, String
        attribute :statusCategory, JiraAgileApi::Resources::Status::Category
      end
    end
  end
end
