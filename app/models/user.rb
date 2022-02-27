class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX , message: "is invalid. Include both letters and numbers" }
  validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }, presence: true
  validates :family_name_kana, format: { with: /\A[ァ-ヶー]+\z/ , message: "is invalid" }, presence: true
  validates :given_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }, presence: true
  validates :given_name_kana, format: { with: /\A[ァ-ヶー]+\z/ , message: "is invalid" }, presence: true
  validates :birthday, presence: true
end
