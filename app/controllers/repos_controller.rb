class ReposController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

end
