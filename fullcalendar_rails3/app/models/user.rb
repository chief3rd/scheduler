class User < ActiveRecord::Base
	acts_as_authentic do |config|
    config.merge_validates_length_of_login_field_options :within => 2..100
  end
end
