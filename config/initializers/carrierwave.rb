CarrierWave.configure do |config|
  config.fog_credentials = { 
      :provider               => 'AWS',
      :aws_access_key_id      => ENV['S3_KEY'],
      :aws_secret_access_key  => ENV['S3_SECRET'],
      :endpoint               => "http://s3-ap-southeast-1.amazonaws.com",
      :region                 => ENV['S3_REGION'] 
  }
  #config.cache_dir = "#{Rails.root}/tmp/uploads" 
  config.fog_directory  = ENV['S3_BUCKET']
end