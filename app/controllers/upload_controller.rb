class UploadController < ApplicationController
  require 'csv'
  def import
    file = params[:file]
    if file.nil?
      return redirect_to upload_index_path, notice: 'No file selected. Please try again.'
    end

    return redirect_to upload_index_path, notice: 'Only CSV files are supported. Please try again.' unless file.content_type == "text/csv"
    # return redirect_to upload_index_path, notice: 'Only CSV files are supported. Please try again.' unless file.content_type == "application/vnd.ms-excel"
    # for the online website instead of localhost
    
    #takes in a csv file for parsing
    file = File.open(file)
    csv = CSV.parse(file, headers: true, col_sep: ';')
    #csv.each do |row|
      #upload_hash = {}
      #upload_hash[:name] = row['username']
      #upload_hash[:identifier] = row['Identifier']
      #upload_hash[:first] = row['First name']
      #upload_hash[:last] = row['Last name']
    #end
    redirect_to upload_index_path, notice: 'Data imported!'
  end
end
