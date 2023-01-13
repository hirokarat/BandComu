class Person < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :profile_image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :bookmarks, dependent: :destroy
  has_many :entries, dependent: :destroy
         
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |person|
      person.password = SecureRandom.urlsafe_base64
      person.password_confirmation = person.password
      person.last_name = '音楽'
      person.first_name = '太郎'
      person.last_name_kana = 'オンガク'
      person.first_name_kana = 'タロウ'
      person.telephone_number = '00000000000'
      person.birthday = '2000-01-01'
    end
  end
  
  def age
    (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000
  end
  
  def full_name
    self.last_name + self.first_name
  end
  
  def full_name_kana
    self.last_name_kana + self.first_name_kana
  end
  
  def get_profile_image(width, height)
      unless profile_image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.png')
        profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end