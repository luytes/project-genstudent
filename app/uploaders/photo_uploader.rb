class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  def default_url(*args)
    ActionController::Base.helpers.asset_path([version_name, "chemi.jpg"].compact.join('_'))
  end
end
