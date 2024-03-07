class Admin::ReportsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @reports = Report.order("created_at DESC").page(params[:page])
  end
  
  def show
    @report = Report.find(params[:id])
    @store = @report.store
  end
  
end