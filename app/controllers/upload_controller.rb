class UploadController < ApplicationController
  require 'csv'
  def import
    file = params[:file]
    return redirect_to upload_index_path, notice: 'Only CSV please' unless file.content_type == "text/csv"
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
