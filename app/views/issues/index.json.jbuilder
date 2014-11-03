json.array!(@issues) do |issue|
  json.extract! issue, :id, :subject, :issue, :status, :instructor_id, :rank, :github
  json.url issue_url(issue, format: :json)
end
