class User < ApplicationRecord
    validates_presence_of :name, :address, :city, :state, :zip
    validates :email, uniqueness: true, presence: true
    validates_presence_of :password, require: true

    has_secure_password


    # def email_taken?
    #   User.
    # end
  end