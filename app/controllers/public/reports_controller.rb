class Public::ReportsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @report = Report.new
    @store = Store.find(params[:store_id])
  end
  
  def create
    store = Store.find(params[:store_id])
    report = current_user.reports.new(report_params)
    report.store_id = store.id
    if report.save
      flash[:notice] = "管理者に報告しました"
      redirect_to report_complete_store_path(store)
    end
    
  end
  
  private

  def report_params
    params.require(:report).permit(:report)
  end
  
end
