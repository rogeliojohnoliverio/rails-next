# frozen_string_literal: true

class Session < ApplicationRecord
  belongs_to :user

  def self.generate!(user)
    create!(user:, token: SecureRandom.alphanumeric(50))
  end
end
