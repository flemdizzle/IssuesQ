class Repo < ActiveRecord::Base
   validates :repo_url, presence: true
   validates :repo_url, format: {with: /\A(https:\/\/)/, message: "Must be a valid URL"}
   has_many :issues

end