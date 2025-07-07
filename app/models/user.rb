class User < ApplicationRecord
    has_secure_password
    has_many :quotes, dependent: :destroy

    validates :acc_status, inclusion: { in: ["Active", "Suspended", "Banned"] }
    validates :fname, :lname, :email, presence: true
end
