class Project < ApplicationRecord
  before_create :assign_random_identity

  has_many :api_keys, class_name: "Api::Key", dependent: :destroy
  has_many :api_events, class_name: "Api::Event", dependent: :destroy

  validates :name, presence: true
  validates :identity, presence: true

  def to_param
    identity
  end

  private

  def assign_random_identity
    self.identity = SecureRandom.alphanumeric(16)
  end
end
