class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :name
    validates :birth_day
    
    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :first_name
      validates :family_name
    end

    with_options format: {with: /\A[ァ-ヶー－]+\z/ } do
      validates :read_first 
      validates :read_family
    end
  end

  validates :password, format: {with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}

  has_many :items
  has_many :orders
end
