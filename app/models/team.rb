class Team < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :header_image
  has_one_attached :profile_image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :journals, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :entries, dependent: :destroy

  def get_header_image(width, height)
      unless header_image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.png')
        header_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
    header_image.variant(resize_to_limit: [width, height]).processed
  end

  def get_profile_image(width, height)
      unless profile_image.attached?
        file_path = Rails.root.join('app/assets/images/no_image.png')
        profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |team|
      team.password = SecureRandom.urlsafe_base64
      team.password_confirmation = team.password
      team.name = 'BandMan'
      team.age = '25'
      team.count ='5'
      team.genre = 0
      team.area = 0
    end
  end

  def bookmarked_by?(person)
    bookmarks.where(person_id: person).exists?
  end

  def entried_by?(person)
     entries.where(person_id: person).exists?
  end

  enum genre:{"---":0,
              軽音楽:1,吹奏楽:2,管弦楽:3
  },_prefix: true

  enum area:{
     "---":0,
     北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
     茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
     新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
     岐阜県:21,静岡県:22,愛知県:23,三重県:24,
     滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
     鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
     徳島県:36,香川県:37,愛媛県:38,高知県:39,
     福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,
     沖縄県:47
   }, _prefix: true

   scope :get_by_area, ->(area) {where(area: area)}
   scope :get_by_genre, ->(genre) {where(genre: genre)}
   scope :get_by_area_genre, ->(area,genre){where(area: area,genre: genre)}
end
