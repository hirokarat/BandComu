class Person < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  def self.guest_person
    find_or_create_by!(email: 'aaa@aaa.com') do |person|
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
         
end
