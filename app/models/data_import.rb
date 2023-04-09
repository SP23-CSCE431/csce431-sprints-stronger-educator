class DataImport < ApplicationRecord
    self.table_name = "data_imports"
    has_many_attached :images
    def create
        @data_import = DataImport.new(data_import_params)
        if @data_import.save
            redirect_to @data_import
        else
            render 'new'
        end
    end

    private

    def data_import_params
        params.require(:data_import).permit(:files, :campus_id, :district_id, images: [])
    end
end
