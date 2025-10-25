class Api::Event < ApplicationRecord
  belongs_to :api_key, class_name: "Api::Key"

  validates :name, presence: true

  after_initialize do
    self.properties ||= {}
  end
end
