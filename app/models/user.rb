class User < ApplicationRecord
    validates :nama, presence: true
    validates :nomorHp, presence: true
    validates :status, presence: true
end
