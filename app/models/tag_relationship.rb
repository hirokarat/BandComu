class TagRelationship < ApplicationRecord
  belongs_to :journal
  belongs_to :tag
  validates :journal_id, presence: true
  validates :tag_id, presence: true
end
