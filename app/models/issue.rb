class Issue < ActiveRecord::Base
  belongs_to :instructor
  belongs_to :repo

  def self.create_from_git(url)
    link = open(url)

    doc = Nokogiri::HTML(link)

    issues = doc.css('#issues-container ul > li .issue-title a.issue-title-link')
    issues.each do |issue|
      issue_params = {
        subject: issue.text.strip,
        github: issue['href'],
      }
      Issue.create(issue_params) 
    end
  end

  def getComments
    link = open("https://github.com" + self.github)

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
