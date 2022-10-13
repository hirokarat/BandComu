class Team < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def self.guest
    find_or_create_by!(email: 'aaa@aaa.com') do |team|
      team.password = SecureRandom.urlsafe_base64
      team.password_confirmation = team.password
      team.name = 'BandMan'
      team.age = '25'
      team.count ='5'
      team.genre = '0'
      team.area = '0'

    end
  end
end
