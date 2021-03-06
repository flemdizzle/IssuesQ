class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index
    if user_signed_in?
      @gituser = Gituser.find_by user_id: current_user.id.to_s
      redirect_to '/' if @gituser.gitname.nil?
      @issues = Issue.all.sort_by { |issue| issue.created_at }
      @user_issues = Issue.all.where(:closed => nil).where(:user_id => current_user.id)
      # @issues = Issue.all.sort_by { |issue| issue.created_at }
      @open_issues = Issue.all.where(:closed => nil).sort_by { |issue| issue.created_at }
      @closed_issues = Issue.all.where(:closed => "closed").sort_by { |issue| issue.created_at }
    else
      redirect_to '/'
    end
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to issues_path, notice: 'Issue was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def assign_issue
    @issue = Issue.find(params[:id])
    @issue.user_id = current_user.id
    @issue.save
    redirect_to issues_path
  end

  def assign_rank
    @issue = Issue.find(params[:id])
    @issue.rank = params[:issue][:rank]
    @issue.save
    redirect_to issues_path
  end

  def close_issue
    @issue = Issue.find(params[:id])
    @issue.closed = 'closed'
    @issue.save
    redirect_to issues_path
  end


  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_issue
    @issue = Issue.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    params.require(:issue).permit(:subject, :issue, :status, :instructor_id, :rank, :github)
  end
end
