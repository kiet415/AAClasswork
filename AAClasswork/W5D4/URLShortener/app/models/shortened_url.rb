# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :text             not null
#  short_url  :text             not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'securerandom'

class ShortenedUrl < ApplicationRecord
    validates :long_url, :short_url, presence: true
    validates :long_url, :short_url, uniqueness: true
    
    def self.random_code
        SecureRandom.urlsafe_base64
    end
end

# p ShortenedUrl.random_code
p SecureRandom.base64