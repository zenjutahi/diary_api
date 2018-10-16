class Item < ApplicationRecord
  # association
  belongs_to :diary

  # validation
  validates_presence_of :name
end
