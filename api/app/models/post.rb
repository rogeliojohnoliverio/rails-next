# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  belongs_to :user
  has_many_attached :attachments
end
