class DataImport < ApplicationRecord
    self.table_name = "data_imports"

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
        params.require(:data_import).permit(:data_import_id, :name)
    end
end
