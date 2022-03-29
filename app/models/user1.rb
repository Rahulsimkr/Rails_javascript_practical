class User1 < ApplicationRecord
  # has_one_attached :picture do |attachable|
  #   attachable.variant :thumb, resize_to_limit: [100, 100]
  # end
  has_many_attached :picture
end
