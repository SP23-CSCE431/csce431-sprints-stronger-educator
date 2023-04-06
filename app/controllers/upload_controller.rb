class UploadController < ApplicationController
  require 'csv'
  def import
    file = params[:file]
    if file.nil?
      return redirect_to upload_index_path, notice: 'No file selected. Please try again.'
    end

    return redirect_to upload_index_path, notice: 'Only CSV files are supported. Please try again.' unless file.content_type == "application/vnd.ms-excel"

    # binding.b 
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ';')
    #csv.each do |row|
      #upload_hash = {}
      #upload_hash[:name] = row['username']
      #upload_hash[:identifier] = row['Identifier']
      #upload_hash[:first] = row['First name']
      #upload_hash[:last] = row['Last name']
    #end
    redirect_to upload_index_path, notice: 'Users imported!'
  end
end
