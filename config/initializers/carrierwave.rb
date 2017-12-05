CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV.fetch('AWS_BON_ACCESS_KEY'),
      aws_secret_access_key: ENV.fetch('AWS_BON_SECRET_KEY'),
      region:                'us-east-1'
    }
    config.fog_directory  = 'martin-bonappetit'
    config.fog_attributes = { cache_control: "public, max-age=#{365.day.to_i}" }
  end
end
