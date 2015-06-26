require 'elasticsearch/model'

class Post < ActiveRecord::Base
  
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  accepts_nested_attributes_for :images, :comments
  validates :title, presence: true,
                      length: { minimum: 5 }
                      
end

Post.import # for auto sync model with elastic search
