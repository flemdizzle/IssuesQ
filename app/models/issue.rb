require 'open-uri'

class Issue < ActiveRecord::Base
  belongs_to :user
  belongs_to :repo

  def self.create_from_git(url, repo)
    link = open("#{url}/issues")

    doc = Nokogiri::HTML(link)

    issues = doc.css('#issues-container ul > li .issue-title a.issue-title-link')
    issues.each do |issue|
      issue_params = {
        subject: issue.text.strip,
        issue_url: issue['href'],
        author: doc.css('.author span').text.strip
      }
      new_issue = Issue.create(issue_params) 
      repo.issues << new_issue
    end
  end

  def getComments
    link = open("https://github.com" + self.issue_url)

    doc = Nokogiri::HTML(link)

    comments = doc.css('#discussion_bucket .comment')
    comments_array = []
    comments.each do |comment|
      comment_hash = {
        author: comment.css("a.author").text,
        body:comment.css(".comment-body").text.strip
      }
      comments_array << comment_hash
    end
    comments_array
  end
  
end
