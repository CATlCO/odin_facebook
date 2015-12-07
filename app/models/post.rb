class Post < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  validates_presence_of :content, :user_id
end
