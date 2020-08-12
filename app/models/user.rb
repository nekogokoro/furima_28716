class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do

  VALID_PASSWORD = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_NAME = /\A[ぁ-んァ-ン一-龥]/
  VALID_KANA_NAME = /\A[ァ-ヶー－]+\z/

  

    validates :password,      format: { with: VALID_PASSWORD }, confirmation: true
    salidates :email,         format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :nick_name, uniqueness: { case_sensitive: true }
    validates :first_name,     format: { with: VALID_NAME }
    validates :last_name,      format: { with: VALID_NAME }
    validates :first_name_kana,    format: { with: VALID_KANA_NAME }
    validates :last_name_kana,     format: { with: VALID_KANA_NAME }
    validates :birthday
  end
end