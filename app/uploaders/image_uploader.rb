class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick

  if Rials.env.production?
    storage :fog
  else
    storage :file
  end

  process convert: 'jpg'

  # 保存するディレクトリ名
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "default.jpg"
  end

  version :_300 do
    process :resize_to_fill => [300, 300]
  end

  version :_500 do
    process :resize_to_fill => [500, 500]
  end

  version :_700 do
    process :resize_to_fill => [700, 700]
  end

  # 許可する画像の拡張子
  def extension_white_list
    %W[jpg jpeg gif png]
  end

  # 変換したファイルのファイル名の規則
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end

end
