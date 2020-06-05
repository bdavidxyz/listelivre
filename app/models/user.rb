class User < ApplicationRecord
  include Clearance::User

  validates :email, presence: true, uniqueness: true

  enum role: {
    contributeur: "contributeur", 
    superadmin: "superadmin", 
  }
  

end
