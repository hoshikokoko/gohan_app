class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :post_images, dependent: :destroy
  
  has_one_attached :profile_image
  
  def get_plofile_image(widh, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/sample_auther1.jpg')
      plofile_image.attach(io: File.open(file_path), filename: 'default_image.jpg', content_type: 'image.jpeg')
    end
    profile_image_variant(resize_to_limit: [width, height]).processed
  end
end
