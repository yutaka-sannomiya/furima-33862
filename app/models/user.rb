class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :nickname, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Password Include both letters and numbers' 
    
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Last name Full-width characters
    ' } do
    validates :last_name, presence: true
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'first name Full-width characters
    ' } do
    validates :first_name, presence: true
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'Last name kana Full-width katakana characters' } do
    validates :last_name_kana, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'first name kana Full-width katakana characters' } do
    validates :first_name_kana, presence: true
  end
    validates :birthday, presence: true

end
