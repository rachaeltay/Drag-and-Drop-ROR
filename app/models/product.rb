class Product < ActiveRecord::Base
  has_many :pics
  mount_uploader :picture, PictureUploader
end
