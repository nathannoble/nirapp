require 'elasticsearch/model'

class Post < ActiveRecord::Base
  
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  accepts_nested_attributes_for :images, :comments
  validates :title, presence: true, length: { minimum: 5 }
  
  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'snowball', index_options: 'offsets'
      indexes :text, analyzer: 'snowball'
    end
  end             
                      
  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title^10', 'text']
          }
        },
        highlight: {
          pre_tags: ['<em>'],
          post_tags: ['</em>'],
          fields: {
            title: {},
            text: {}
          }
        }
      }
    )
  end
                  
end

# Delete previous index
Post.__elasticsearch__.client.indices.delete index: Post.index_name rescue nil
 
# Create the new index
Post.__elasticsearch__.client.indices.create \
  index: Post.index_name,
  body: { settings: Post.settings.to_hash, mappings: Post.mappings.to_hash }
 
# Index all posts
Post.import
