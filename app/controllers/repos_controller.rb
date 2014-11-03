class ReposController < ApplicationController

  def new
    @repo = Repo.new
  end

  def create
    repo = Repo.create(repo_params)
    Issue.create_from_git(params[:repo][:repo_url], repo)
    @issues = Issue.all
    redirect_to issues_path
  end

  private

  def repo_params
    params.require(:repo).permit(:repo_url)
  end

end
