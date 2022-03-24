class User < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true, on: :create

  # def check_password
  #   u = User.find_by_id(self.id)
  #   if self.password != u.password and self.email != u.email
  #     errors.add(:base, "Password is incorrect.")
  #   else
  #     self.password = u.password
  #   end
  # end
end
