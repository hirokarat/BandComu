class Journal < ApplicationRecord
  has_one_attached :activity_image
  
   belongs_to :tea
  
  def get_activity_image(width, height)
      unless activity_image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.png')
        activity_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
    activity_image.variant(resize_to_limit: [width, height]).processed
  end
end
