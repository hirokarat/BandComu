class Journal < ApplicationRecord
  has_one_attached :activity_image
  
  belongs_to :team
  has_many :tag_relationships,dependent: :destroy
  has_many :tags,through: :tag_relationships
  
  def get_activity_image(width, height)
      unless activity_image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.png')
        activity_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
    activity_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete　Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_jounal_tag = Tag.find_or_create_by(name: new)
      self.tags << new_jounal_tag
   end
  end
  
end
