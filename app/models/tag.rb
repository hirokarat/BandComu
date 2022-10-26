class Tag < ApplicationRecord
  has_many :tag_relationships,dependent: :destroy, foreign_key: 'tag_id'
  # タグは複数の投稿を持つ　それは、post_tagsを通じて参照できる
  has_many :journals,through: :tag_relationships

  validates :name, uniqueness: true, presence: true
end
