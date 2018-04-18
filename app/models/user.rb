class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments, dependent: :restrict_with_error
  has_many :restaurants, through: :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar , AvatarImageUploader
  validates_presence_of :name
  def admin?
    self.role =='admin'
  end
  
end
