Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
            secure_image_url: true,
            scope: 'public_profile,email,user_photos'
            
end