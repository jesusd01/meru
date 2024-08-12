class User < ApplicationRecord
    # has_secure_password

    validates :email, presence: true, uniqueness:true
    validates :username, presence: true, uniqueness:true,
        format: {
            with: /\A[a-z0-9A-Z]+\z/,
            message: :invalid
        }
    # validates :password, presence: true
    has_secure_password
end
