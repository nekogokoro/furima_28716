class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  
  
  validates :nick_name, :email, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i, message: 'need 1~9&a~z' }
  validates :first_name, :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/ }
  validates :birthday, presence: true, format: { without: /\A0/ }
end