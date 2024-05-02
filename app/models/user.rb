class User < ApplicationRecord
    has_many :gossips
    has_many :tags
    has_many :recipients
    has_many :messages, through: :recipients
    belongs_to :city, optional: true
    validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" } 
    validates :last_name, 
    presence: true
    validates :first_name, 
    presence: true
    validates :age, 
    presence: true
    has_many :comments
    has_many :gossips, through: :comments
    has_secure_password
end
