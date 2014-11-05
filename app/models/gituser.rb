class Gituser < ActiveRecord::Base
  belongs_to :user
  has_one :gituser
end