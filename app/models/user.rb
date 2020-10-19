class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :purchases

  validates :nickname, presence: true
  validates :email, unique: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Password Include both letters and numbers'

  with_options presense: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Last name Full-width characters' } do
    validates :last_name
  end
  with_options presense: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'First name Full-width characters' } do
    validates :first_name
  end
  with_options presense: true, format: { with: /\A[ァ-ン]+\z/, message: 'Last name kana Full-width katakana characters' } do
    validates :last_name_kana
  end
  with_options presense: true, format: { with: /\A[ァ-ン]+\z/, 'First name kana Full-width katakana characters' } do
    validates :first_name_kana
  end
  validates :birth_day, presence: true
end
