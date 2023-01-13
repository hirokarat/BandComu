class Journal < ApplicationRecord
  has_one_attached :activity_image

  belongs_to :team
  has_many :tag_relationships,dependent: :destroy
  has_many :tags,through: :tag_relationships

  validates :activity_image, presence: true
  validates :journal, presence: true
  
  def get_activity_image(width, height)
      unless activity_image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.png')
        activity_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
    activity_image.variant(resize_to_limit: [width, height]).processed
  end

  def save_journals(tags)
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags
    # Destroy
    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(name:old_name)
    end
    # Create
    new_tags.each do |new_name|
      journal_tag = Tag.find_or_create_by(name:new_name)
      self.tags << journal_tag
    end
  end
end
