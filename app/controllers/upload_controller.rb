class UploadController < ApplicationController
  def import
    return redirect_to upload_path, notice: 'Only CSV please' unless params[:file].content_type == "text/csv"
    # binding.b 
    redirect_to upload_path, notice: 'Users imported!'
  end
end
