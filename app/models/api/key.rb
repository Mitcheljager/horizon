class Api::Key < ApplicationRecord
  before_create :assign_random_identity

  belongs_to :project

  validates :domain, presence: true

  def to_param
    identity
  end

  private

  def assign_random_identity
    self.identity = SecureRandom.alphanumeric(16)
  end
end
