require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      region: ENV['AWS_S3_REGION'],
      aws_access_key_id: ENV['AWS_IAM_ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['AWS_IAM_ACCESS_KEY'],
    }
    #環境毎にバケットを分ける(バケット: S3に保存されるファイルを置く為の物)
    config.fog_directory = ENV['AWS_S3_BUCKET']

    #画像アップロードの有効期限
    config.fog_attributes = {cache_control: "public, max-age=#{365.days.to_i}"}
  end

    #ファイル名に日本語の許可
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
end
