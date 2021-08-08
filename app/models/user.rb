class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name,               presence: true
  validates :first_name,            presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name,         presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :read_first,           presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :read_family,           presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_day,           presence: true

  validates :password, format: {with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

  has_many :items
  has_many :orders
end
