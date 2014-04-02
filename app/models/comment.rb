class Comment < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :user
  belongs_to :answer
  validates_presence_of :body
end
