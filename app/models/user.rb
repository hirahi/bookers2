class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          has_many :books, dependent: :destroy
          has_one_attached :profile_image
         validates :name,  presence: true, length: {minimum: 2,maximum: 20}, uniqueness:true
         validates :introduction,   length: {maximum: 50}
  def get_image()
    if profile_image.attached?
      profile_image
    else
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'profile_image/jpeg')
    end
  end
end