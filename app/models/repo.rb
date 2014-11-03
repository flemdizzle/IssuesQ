class Repo < ActiveRecord::Base
   validates :repo_url, presence: true
   has_many :issues

end