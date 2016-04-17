class Classification < ActiveRecord::Base
  validates :content, presence: true
end