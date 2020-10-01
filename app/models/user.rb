class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は半角英数字混合で入力して下さい'}
  validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角（漢字・ひらがな・カタカナ）で入力して下さい'}
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力して下さい' }
  validates :kana_family_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）で入力して下さい' }
  validates :kana_first_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角（カタカナ）で入力して下さい' }
  validates :birthday, presence: true

  has_many :items
  has_many :comments
  has_many :orders
end
