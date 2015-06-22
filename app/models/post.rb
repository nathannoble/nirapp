class Post < ActiveRecord::Base
  
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  accepts_nested_attributes_for :images, :comments
  validates :title, presence: true,
                      length: { minimum: 5 }
                      
end
