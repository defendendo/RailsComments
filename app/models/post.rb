class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comms, dependent: :destroy
end
